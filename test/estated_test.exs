defmodule EstatedTest do
  use ExUnit.Case, async: true

  alias Estated.Error
  alias Estated.Property
  alias Estated.PropertyRequest.Combined
  alias Estated.PropertyRequest.FipsAndApn
  alias Estated.PropertyRequest.Parsed
  alias Estated.PropertyRequest.Split
  alias Estated.Response
  alias Estated.Warning

  # get_property/3 uses invalid syntax to abbreviate the response struct
  doctest Estated, except: [get_property: 3]

  describe "sandboxed get_property/3" do
    @describetag :estated_sandbox_api

    setup _context do
      api_key = System.fetch_env!("ESTATED_SANDBOX_API_KEY")
      {:ok, api_key: api_key}
    end

    @tag :integration
    test "with a PropertyRequest.Combined", %{api_key: api_key} do
      property_request = %Combined{
        combined_address: "1101 Sloan St, Scranton, PA 18504"
      }

      assert {:ok,
              %Response{
                data: %Property{},
                error: nil,
                metadata: %Response.Metadata{},
                warnings: []
              }} = Estated.get_property(api_key, property_request, sandbox: true)
    end

    @tag :integration
    test "with a PropertyRequest.FipsAndApn", %{api_key: api_key} do
      property_request = %FipsAndApn{
        fips: "42069",
        apn: "15613060014"
      }

      assert {:ok,
              %Response{
                data: %Property{},
                error: nil,
                metadata: %Response.Metadata{},
                warnings: []
              }} = Estated.get_property(api_key, property_request, sandbox: true)
    end

    @tag :integration
    test "with a PropertyRequest.Parsed", %{api_key: api_key} do
      property_request = %Parsed{
        street_number: "1101",
        street_name: "Sloan",
        street_suffix: "St",
        city: "Scranton",
        state: "PA",
        zip_code: "18504"
      }

      assert {:ok,
              %Response{
                data: %Property{},
                error: nil,
                metadata: %Response.Metadata{},
                warnings: []
              }} = Estated.get_property(api_key, property_request, sandbox: true)
    end

    @tag :integration
    test "with a PropertyRequest.Split", %{api_key: api_key} do
      property_request = %Split{
        street_address: "1101 Sloan St",
        city: "Scranton",
        state: "PA",
        zip_code: "18504"
      }

      assert {:ok,
              %Response{
                data: %Property{},
                error: nil,
                metadata: %Response.Metadata{},
                warnings: []
              }} = Estated.get_property(api_key, property_request, sandbox: true)
    end

    @tag :integration
    test "Estated warning response", %{api_key: api_key} do
      property_request = %FipsAndApn{
        fips: "48361",
        apn: "11-22-33-44"
      }

      assert {:ok,
              %Response{
                data: nil,
                error: nil,
                metadata: %Response.Metadata{},
                warnings: [
                  %Warning{
                    code: "PW02",
                    description: "Multiple properties were found for the given input",
                    metadata: %Warning.Metadata{
                      properties: [
                        %Warning.Metadata.Property{apn: "009771-000910 01", fips: "48361"},
                        %Warning.Metadata.Property{apn: "009771-000910 02", fips: "48361"}
                      ]
                    },
                    title: "Property Warning"
                  }
                ]
              }} = Estated.get_property(api_key, property_request, sandbox: true)
    end

    @tag :integration
    test "Estated error response", %{api_key: api_key} do
      property_request = %FipsAndApn{
        fips: "06037",
        apn: "22-33-44"
      }

      assert {:ok,
              %Response{
                data: nil,
                error: %Error{
                  code: "APE01",
                  description: "The given address was unable to be parsed",
                  metadata: %{},
                  status_code: 422,
                  title: "Address Parser Error"
                },
                metadata: %Response.Metadata{},
                warnings: []
              }} = Estated.get_property(api_key, property_request, sandbox: true)
    end

    @tag :integration
    test "Estated invalid API key response" do
      api_key = "invalid"

      property_request = %FipsAndApn{
        fips: "42069",
        apn: "15613060014"
      }

      assert {:ok,
              %Response{
                data: nil,
                error: %Error{
                  code: "AE02",
                  description: "The given token is invalid",
                  metadata: %{},
                  status_code: 403,
                  title: "Authorization Error"
                },
                metadata: %Response.Metadata{},
                warnings: []
              }} = Estated.get_property(api_key, property_request, sandbox: true)
    end
  end
end

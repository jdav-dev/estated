defmodule EstatedTest do
  use ExUnit.Case, async: true

  alias Estated.CombinedPropertyRequest
  alias Estated.Error
  alias Estated.FipsAndApnPropertyRequest
  alias Estated.ParsedPropertyRequest
  alias Estated.Property
  alias Estated.Response
  alias Estated.ResponseMetadata
  alias Estated.SplitPropertyRequest
  alias Estated.Warning
  alias Estated.WarningMetadata
  alias Estated.WarningMetadataProperty

  # get_property/3 uses invalid syntax to abbreviate the response struct
  doctest Estated, except: [get_property: 3]

  describe "sandboxed get_property/3" do
    @describetag :estated_sandbox_api

    setup _context do
      api_key = System.fetch_env!("ESTATED_SANDBOX_API_KEY")
      {:ok, api_key: api_key}
    end

    @tag :integration
    test "with a CombinedPropertyRequest", %{api_key: api_key} do
      property_request = %CombinedPropertyRequest{
        combined_address: "1101 Sloan St, Scranton, PA 18504"
      }

      assert {:ok,
              %Response{
                data: %Property{},
                error: nil,
                metadata: %ResponseMetadata{},
                warnings: []
              }} = Estated.get_property(api_key, property_request, sandbox: true)
    end

    @tag :integration
    test "with a FipsAndApnPropertyRequest", %{api_key: api_key} do
      property_request = %FipsAndApnPropertyRequest{
        fips: "42069",
        apn: "15613060014"
      }

      assert {:ok,
              %Response{
                data: %Property{},
                error: nil,
                metadata: %ResponseMetadata{},
                warnings: []
              }} = Estated.get_property(api_key, property_request, sandbox: true)
    end

    @tag :integration
    test "with a ParsedPropertyRequest", %{api_key: api_key} do
      property_request = %ParsedPropertyRequest{
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
                metadata: %ResponseMetadata{},
                warnings: []
              }} = Estated.get_property(api_key, property_request, sandbox: true)
    end

    @tag :integration
    test "with a SplitPropertyRequest", %{api_key: api_key} do
      property_request = %SplitPropertyRequest{
        street_address: "1101 Sloan St",
        city: "Scranton",
        state: "PA",
        zip_code: "18504"
      }

      assert {:ok,
              %Response{
                data: %Property{},
                error: nil,
                metadata: %ResponseMetadata{},
                warnings: []
              }} = Estated.get_property(api_key, property_request, sandbox: true)
    end

    @tag :integration
    test "Estated warning response", %{api_key: api_key} do
      property_request = %FipsAndApnPropertyRequest{
        fips: "48361",
        apn: "11-22-33-44"
      }

      assert {:ok,
              %Response{
                data: nil,
                error: nil,
                metadata: %ResponseMetadata{},
                warnings: [
                  %Warning{
                    code: "PW02",
                    description: "Multiple properties were found for the given input",
                    metadata: %WarningMetadata{
                      properties: [
                        %WarningMetadataProperty{apn: "009771-000910 01", fips: "48361"},
                        %WarningMetadataProperty{apn: "009771-000910 02", fips: "48361"}
                      ]
                    },
                    title: "Property Warning"
                  }
                ]
              }} = Estated.get_property(api_key, property_request, sandbox: true)
    end

    @tag :integration
    test "Estated error response", %{api_key: api_key} do
      property_request = %FipsAndApnPropertyRequest{
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
                metadata: %ResponseMetadata{},
                warnings: []
              }} = Estated.get_property(api_key, property_request, sandbox: true)
    end

    @tag :integration
    test "Estated invalid API key response" do
      api_key = "invalid"

      property_request = %FipsAndApnPropertyRequest{
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
                metadata: %ResponseMetadata{},
                warnings: []
              }} = Estated.get_property(api_key, property_request, sandbox: true)
    end
  end
end

defmodule Estated.AddressTest do
  use ExUnit.Case, async: true

  alias Estated.Address

  doctest Address

  describe "cast/1" do
    @tag :unit
    test "casts a map as an Address" do
      address = %{
        "street_number" => "3450",
        "street_pre_direction" => "N",
        "street_name" => "MAIN",
        "street_suffix" => "ST",
        "street_post_direction" => "N",
        "unit_type" => "APT",
        "unit_number" => "101A",
        "formatted_street_address" => "1650 N 16TH ST SW APT 101",
        "city" => "CHICAGO",
        "state" => "IL",
        "zip_code" => "60614",
        "zip_plus_four_code" => "5505",
        "carrier_code" => "R001",
        "latitude" => 41.912406,
        "longitude" => -87.649191,
        "geocoding_accuracy" => "PARCEL CENTROID",
        "census_tract" => "10570200.002009",
        "ignore me" => nil
      }

      assert %Address{
               street_number: "3450",
               street_pre_direction: "N",
               street_name: "MAIN",
               street_suffix: "ST",
               street_post_direction: "N",
               unit_type: "APT",
               unit_number: "101A",
               formatted_street_address: "1650 N 16TH ST SW APT 101",
               city: "CHICAGO",
               state: "IL",
               zip_code: "60614",
               zip_plus_four_code: "5505",
               carrier_code: "R001",
               latitude: 41.912406,
               longitude: -87.649191,
               geocoding_accuracy: "PARCEL CENTROID",
               census_tract: "10570200.002009"
             } == Address.cast(address)
    end

    @tag :unit
    test "casts nil as nil" do
      assert nil == Address.cast(nil)
    end
  end
end

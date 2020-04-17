defmodule Estated.ParcelTest do
  use ExUnit.Case, async: true

  alias Estated.Parcel

  doctest Parcel

  describe "cast/1" do
    @tag :unit
    test "casts a map as a Parcel" do
      parcel = %{
        "apn_original" => "001-090-04-02",
        "apn_unformatted" => "0010900402",
        "apn_previous" => "001-090-04-00",
        "fips_code" => "12086",
        "depth_ft" => 120.0,
        "frontage_ft" => 260.0,
        "area_sq_ft" => 31_200,
        "area_acres" => 0.716,
        "county_name" => "COOK",
        "county_land_use_code" => "SFR01",
        "county_land_use_description" => "RESIDENTIAL SINGLE DWELLING",
        "standardized_land_use_category" => "MULTI-FAMILY RESIDENTIAL",
        "standardized_land_use_type" => "TOWNHOUSE",
        "location_descriptions" => ["In Cul-de-sac", "Has Mountain view"],
        "zoning" => "T/G",
        "building_count" => 1,
        "tax_account_number" => "0134601209K",
        "legal_description" =>
          "Legal subdivision 4, Section 10, Township 82, West of the 6th Meridian, New York District",
        "lot_code" => "MORE THAN ONE LOT",
        "lot_number" => "1-13,15",
        "subdivision" => "CRYSTAL LAKE FOREST",
        "municipality" => "FELL TOWNSHIP",
        "section_township_range" => "SEC 14 TWN 1N RNG 11E",
        "ignore me" => nil
      }

      assert %Parcel{
               apn_original: "001-090-04-02",
               apn_unformatted: "0010900402",
               apn_previous: "001-090-04-00",
               fips_code: "12086",
               depth_ft: 120.0,
               frontage_ft: 260.0,
               area_sq_ft: 31_200,
               area_acres: 0.716,
               county_name: "COOK",
               county_land_use_code: "SFR01",
               county_land_use_description: "RESIDENTIAL SINGLE DWELLING",
               standardized_land_use_category: "MULTI-FAMILY RESIDENTIAL",
               standardized_land_use_type: "TOWNHOUSE",
               location_descriptions: ["In Cul-de-sac", "Has Mountain view"],
               zoning: "T/G",
               building_count: 1,
               tax_account_number: "0134601209K",
               legal_description:
                 "Legal subdivision 4, Section 10, Township 82, West of the 6th Meridian, New York District",
               lot_code: "MORE THAN ONE LOT",
               lot_number: "1-13,15",
               subdivision: "CRYSTAL LAKE FOREST",
               municipality: "FELL TOWNSHIP",
               section_township_range: "SEC 14 TWN 1N RNG 11E"
             } == Parcel.cast(parcel)
    end

    @tag :unit
    test "casts nil as nil" do
      assert nil == Parcel.cast(nil)
    end
  end
end

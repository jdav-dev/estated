defmodule Estated.Property.StructureTest do
  use ExUnit.Case, async: true

  alias Estated.Property.Structure
  alias Estated.Property.Structure.OtherArea
  alias Estated.Property.Structure.OtherFeature
  alias Estated.Property.Structure.OtherImprovement

  doctest Structure

  describe "cast/1" do
    @tag :unit
    test "casts a map as a Structure" do
      structure = %{
        "year_built" => 1923,
        "effective_year_built" => 1996,
        "stories" => "2+A",
        "rooms_count" => 4,
        "beds_count" => 3,
        "baths" => 2.5,
        "partial_baths_count" => 2,
        "units_count" => 1,
        "parking_type" => "DETACHED GARAGE",
        "parking_spaces_count" => 2,
        "pool_type" => "HEATED POOL",
        "architecture_type" => "SPANISH",
        "construction_type" => "WOOD",
        "exterior_wall_type" => "STUCCO",
        "foundation_type" => "CONCRETE",
        "roof_material_type" => "ASPHALT",
        "roof_style_type" => "GABLE",
        "heating_type" => "BASEBOARD",
        "heating_fuel_type" => "GAS",
        "air_conditioning_type" => "CENTRAL",
        "fireplaces" => "2",
        "basement_type" => "FULL BASEMENT",
        "quality" => "A+",
        "condition" => "FAIR",
        "flooring_types" => ["CARPET", "MARBLE"],
        "plumbing_fixtures_count" => 1,
        "interior_wall_type" => "PLASTER",
        "water_type" => "MUNICIPAL",
        "sewer_type" => "SEPTIC",
        "total_area_sq_ft" => 1692,
        "other_areas" => [%{}],
        "other_features" => [%{}],
        "other_improvements" => [%{}],
        "other_rooms" => ["LAUNDRY ROOM", "HOME OFFICE"],
        "amenities" => ["WINE CELLAR", "TENNIS COURT"],
        "ignore me" => nil
      }

      assert %Structure{
               year_built: 1923,
               effective_year_built: 1996,
               stories: "2+A",
               rooms_count: 4,
               beds_count: 3,
               baths: 2.5,
               partial_baths_count: 2,
               units_count: 1,
               parking_type: "DETACHED GARAGE",
               parking_spaces_count: 2,
               pool_type: "HEATED POOL",
               architecture_type: "SPANISH",
               construction_type: "WOOD",
               exterior_wall_type: "STUCCO",
               foundation_type: "CONCRETE",
               roof_material_type: "ASPHALT",
               roof_style_type: "GABLE",
               heating_type: "BASEBOARD",
               heating_fuel_type: "GAS",
               air_conditioning_type: "CENTRAL",
               fireplaces: "2",
               basement_type: "FULL BASEMENT",
               quality: "A+",
               condition: "FAIR",
               flooring_types: ["CARPET", "MARBLE"],
               plumbing_fixtures_count: 1,
               interior_wall_type: "PLASTER",
               water_type: "MUNICIPAL",
               sewer_type: "SEPTIC",
               total_area_sq_ft: 1692,
               other_areas: [%OtherArea{}],
               other_features: [%OtherFeature{}],
               other_improvements: [%OtherImprovement{}],
               other_rooms: ["LAUNDRY ROOM", "HOME OFFICE"],
               amenities: ["WINE CELLAR", "TENNIS COURT"]
             } == Structure.cast(structure)
    end

    @tag :unit
    test "casts nil as nil" do
      assert nil == Structure.cast(nil)
    end
  end
end

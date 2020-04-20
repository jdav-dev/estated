defmodule Estated.Property.Structure.OtherFeatureTest do
  use ExUnit.Case, async: true

  alias Estated.Property.Structure.OtherFeature

  doctest OtherFeature

  describe "cast_list/1" do
    @tag :unit
    test "casts a list of maps as a list of OtherFeatures" do
      other_features = [
        %{
          "type" => "DRIVEWAY",
          "sq_ft" => "240",
          "ignore me" => nil
        }
      ]

      assert [
               %OtherFeature{
                 type: "DRIVEWAY",
                 sq_ft: "240"
               }
             ] == OtherFeature.cast_list(other_features)
    end

    @tag :unit
    test "casts nil as an empty list" do
      assert [] == OtherFeature.cast_list(nil)
    end
  end
end

defmodule Estated.OtherAreaTest do
  use ExUnit.Case, async: true

  alias Estated.OtherArea

  doctest OtherArea

  describe "cast_list/1" do
    @tag :unit
    test "casts a list of maps as a list of OtherAreas" do
      other_areas = [
        %{
          "type" => "1ST FLOOR",
          "sq_ft" => "1140",
          "ignore me" => nil
        }
      ]

      assert [
               %OtherArea{
                 type: "1ST FLOOR",
                 sq_ft: 1140
               }
             ] == OtherArea.cast_list(other_areas)
    end

    @tag :unit
    test "passes through integers that fail to parse" do
      other_areas = [%{"sq_ft" => "invalid integer"}]
      assert [%OtherArea{sq_ft: "invalid integer"}] == OtherArea.cast_list(other_areas)
    end

    @tag :unit
    test "passes through integers that are not strings" do
      other_areas = [%{"sq_ft" => true}]
      assert [%OtherArea{sq_ft: true}] == OtherArea.cast_list(other_areas)
    end

    @tag :unit
    test "casts nil as an empty list" do
      assert [] == OtherArea.cast_list(nil)
    end
  end
end

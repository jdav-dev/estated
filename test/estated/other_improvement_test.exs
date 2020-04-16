defmodule Estated.OtherImprovementTest do
  use ExUnit.Case, async: true

  alias Estated.OtherImprovement

  doctest OtherImprovement

  describe "cast_list/1" do
    @tag :unit
    test "casts a list of maps as a list of OtherImprovements" do
      other_improvements = [
        %{
          "type" => "GREENHOUSE",
          "sq_ft" => "346",
          "ignore me" => nil
        }
      ]

      assert [
               %OtherImprovement{
                 type: "GREENHOUSE",
                 sq_ft: "346"
               }
             ] == OtherImprovement.cast_list(other_improvements)
    end

    @tag :unit
    test "casts nil as an empty map" do
      assert [] == OtherImprovement.cast_list(nil)
    end
  end
end

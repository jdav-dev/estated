defmodule Estated.AssessmentTest do
  use ExUnit.Case, async: true

  alias Estated.Assessment

  doctest Assessment

  describe "cast_list/1" do
    @tag :unit
    test "casts a list of maps as a list of Assessments" do
      assessments = [
        %{
          "year" => 2018,
          "land_value" => 2580,
          "improvement_value" => 13300,
          "total_value" => 15880,
          "ignore me" => nil
        }
      ]

      assert [
               %Assessment{
                 year: 2018,
                 land_value: 2580,
                 improvement_value: 13300,
                 total_value: 15880
               }
             ] == Assessment.cast_list(assessments)
    end

    @tag :unit
    test "casts nil as an empty list" do
      assert [] == Assessment.cast_list(nil)
    end
  end
end

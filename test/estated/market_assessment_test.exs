defmodule Estated.MarketAssessmentTest do
  use ExUnit.Case, async: true

  alias Estated.MarketAssessment

  doctest MarketAssessment

  describe "cast_list/1" do
    @tag :unit
    test "casts a list of maps as a list of MarketAssessments" do
      market_assessments = [
        %{
          "year" => 2017,
          "land_value" => 3000,
          "improvement_value" => 12000,
          "total_value" => 15000,
          "ignore me" => nil
        }
      ]

      assert [
               %MarketAssessment{
                 year: 2017,
                 land_value: 3000,
                 improvement_value: 12000,
                 total_value: 15000
               }
             ] == MarketAssessment.cast_list(market_assessments)
    end

    @tag :unit
    test "casts nil as an empty list" do
      assert [] == MarketAssessment.cast_list(nil)
    end
  end
end

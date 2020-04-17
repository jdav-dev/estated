defmodule Estated.ValuationTest do
  use ExUnit.Case, async: true

  alias Estated.Valuation

  doctest Valuation

  describe "cast/1" do
    @tag :unit
    test "casts a map as a Valuation" do
      valuation = %{
        "value" => 16_430,
        "high" => 17_220,
        "low" => 15_780,
        "forecast_standard_deviation" => 55,
        "date" => "2019-10-24",
        "ignore me" => nil
      }

      assert %Valuation{
               value: 16_430,
               high: 17_220,
               low: 15_780,
               forecast_standard_deviation: 55,
               date: ~D[2019-10-24]
             } == Valuation.cast(valuation)
    end

    @tag :unit
    test "casts nil as nil" do
      assert nil == Valuation.cast(nil)
    end
  end
end

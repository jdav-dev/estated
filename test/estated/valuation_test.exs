defmodule Estated.ValuationTest do
  use ExUnit.Case, async: true

  alias Estated.Valuation

  doctest Valuation

  describe "cast/1" do
    @tag :unit
    test "casts a map as a Valuation" do
      valuation = %{
        "value" => 16430,
        "high" => 17220,
        "low" => 15780,
        "forecast_standard_deviation" => 55,
        "date" => "2019-10-24",
        "ignore me" => nil
      }

      assert %Valuation{
               value: 16430,
               high: 17220,
               low: 15780,
               forecast_standard_deviation: 55,
               date: ~D[2019-10-24]
             } == Valuation.cast(valuation)
    end

    @tag :unit
    test "passes through dates that fail to parse" do
      valuation = %{"date" => "invalid date"}
      assert %Valuation{date: "invalid date"} == Valuation.cast(valuation)
    end

    @tag :unit
    test "passes through dates that are not strings" do
      valuation = %{"date" => 0}
      assert %Valuation{date: 0} == Valuation.cast(valuation)
    end

    @tag :unit
    test "casts nil as nil" do
      assert nil == Valuation.cast(nil)
    end
  end
end

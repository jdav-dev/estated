defmodule Estated.TaxTest do
  use ExUnit.Case, async: true

  alias Estated.Tax

  doctest Tax

  describe "cast_list/1" do
    @tag :unit
    test "casts a list of maps as a list of Taxes" do
      taxes = [
        %{
          "year" => 2017,
          "amount" => 2247,
          "exemptions" => ["Agricultural", "Low Income"],
          "rate_code_area" => "01H",
          "ignore me" => nil
        }
      ]

      assert [
               %Tax{
                 year: 2017,
                 amount: 2247,
                 exemptions: ["Agricultural", "Low Income"],
                 rate_code_area: "01H"
               }
             ] == Tax.cast_list(taxes)
    end

    @tag :unit
    test "casts nil as an empty list" do
      assert [] == Tax.cast_list(nil)
    end
  end
end

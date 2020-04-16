defmodule Estated.WarningTest do
  use ExUnit.Case, async: true

  alias Estated.Warning
  alias Estated.WarningMetadata

  doctest Warning

  describe "cast_list/1" do
    @tag :unit
    test "casts a list of maps as a list of Warnings" do
      warnings = [
        %{
          "code" => "PW01",
          "title" => "Property Warning",
          "description" => "No property was found for the given input",
          "metadata" => %{},
          "ignore me" => nil
        }
      ]

      assert [
               %Warning{
                 code: "PW01",
                 title: "Property Warning",
                 description: "No property was found for the given input",
                 metadata: %WarningMetadata{}
               }
             ] == Warning.cast_list(warnings)
    end

    @tag :unit
    test "casts nil as an empty list" do
      assert [] == Warning.cast_list(nil)
    end
  end
end

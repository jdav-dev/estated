defmodule Estated.Warning.Metadata.PropertyTest do
  use ExUnit.Case, async: true

  alias Estated.Warning.Metadata.Property

  doctest Property

  describe "cast_list/1" do
    @tag :unit
    test "casts a list of maps as a list of Properties" do
      warning_metadata_properties = [
        %{
          "fips" => "12086",
          "apn" => "001-090-04-02",
          "ignore me" => nil
        }
      ]

      assert [
               %Property{
                 fips: "12086",
                 apn: "001-090-04-02"
               }
             ] == Property.cast_list(warning_metadata_properties)
    end

    @tag :unit
    test "casts nil as an empty list" do
      assert [] == Property.cast_list(nil)
    end
  end
end

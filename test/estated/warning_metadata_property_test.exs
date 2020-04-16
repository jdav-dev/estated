defmodule Estated.WarningMetadataPropertyTest do
  use ExUnit.Case, async: true

  alias Estated.WarningMetadataProperty

  doctest WarningMetadataProperty

  describe "cast_list/1" do
    @tag :unit
    test "casts a list of maps as a list of WarningMetadataProperties" do
      warning_metadata_properties = [
        %{
          "fips" => "12086",
          "apn" => "001-090-04-02",
          "ignore me" => nil
        }
      ]

      assert [
               %WarningMetadataProperty{
                 fips: "12086",
                 apn: "001-090-04-02"
               }
             ] == WarningMetadataProperty.cast_list(warning_metadata_properties)
    end

    @tag :unit
    test "casts nil as an empty list" do
      assert [] == WarningMetadataProperty.cast_list(nil)
    end
  end
end

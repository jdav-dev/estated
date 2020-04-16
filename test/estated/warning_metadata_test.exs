defmodule Estated.WarningMetadataTest do
  use ExUnit.Case, async: true

  alias Estated.WarningMetadata
  alias Estated.WarningMetadataProperty

  doctest WarningMetadata

  describe "cast/1" do
    @tag :unit
    test "casts a map as WarningMetadata" do
      warning_metadata = %{
        "properties" => [%{}],
        "ignore me" => nil
      }

      assert %WarningMetadata{
               properties: [%WarningMetadataProperty{}]
             } == WarningMetadata.cast(warning_metadata)
    end

    @tag :unit
    test "casts nil as nil" do
      assert nil == WarningMetadata.cast(nil)
    end
  end
end

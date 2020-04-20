defmodule Estated.Warning.MetadataTest do
  use ExUnit.Case, async: true

  alias Estated.Warning.Metadata
  alias Estated.Warning.Metadata.Property

  doctest Metadata

  describe "cast/1" do
    @tag :unit
    test "casts a map as Metadata" do
      warning_metadata = %{
        "properties" => [%{}],
        "ignore me" => nil
      }

      assert %Metadata{
               properties: [%Property{}]
             } == Metadata.cast(warning_metadata)
    end

    @tag :unit
    test "casts nil as nil" do
      assert nil == Metadata.cast(nil)
    end
  end
end

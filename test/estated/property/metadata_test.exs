defmodule Estated.Property.MetadataTest do
  use ExUnit.Case, async: true

  alias Estated.Property.Metadata

  doctest Metadata

  describe "cast/1" do
    @tag :unit
    test "casts a map as Metadata" do
      property_metadata = %{
        "publishing_date" => "2018-02-14",
        "ignore me" => nil
      }

      assert %Metadata{
               publishing_date: ~D[2018-02-14]
             } = Metadata.cast(property_metadata)
    end

    @tag :unit
    test "casts nil as nil" do
      assert nil == Metadata.cast(nil)
    end
  end
end

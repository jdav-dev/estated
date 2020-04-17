defmodule Estated.PropertyMetadataTest do
  use ExUnit.Case, async: true

  alias Estated.PropertyMetadata

  doctest PropertyMetadata

  describe "cast/1" do
    @tag :unit
    test "casts a map as PropertyMetadata" do
      property_metadata = %{
        "publishing_date" => "2018-02-14",
        "ignore me" => nil
      }

      assert %PropertyMetadata{
               publishing_date: ~D[2018-02-14]
             } = PropertyMetadata.cast(property_metadata)
    end

    @tag :unit
    test "casts nil as nil" do
      assert nil == PropertyMetadata.cast(nil)
    end
  end
end

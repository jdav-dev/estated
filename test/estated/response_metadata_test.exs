defmodule Estated.ResponseMetadataTest do
  use ExUnit.Case, async: true

  alias Estated.ResponseMetadata

  doctest ResponseMetadata

  describe "cast/1" do
    @tag :unit
    test "casts a map as ResponseMetadata" do
      response_metadata = %{
        "timestamp" => "2019-12-04T22:22:10.009910Z",
        "version" => "0.4.2-1.8.2",
        "ignore me" => nil
      }

      assert %ResponseMetadata{
               timestamp: ~U[2019-12-04T22:22:10.009910Z],
               version: "0.4.2-1.8.2"
             } == ResponseMetadata.cast(response_metadata)
    end

    @tag :unit
    test "passes through timestamps that fail to parse" do
      response_metadata = %{"timestamp" => "invalid timestamp"}

      assert %ResponseMetadata{timestamp: "invalid timestamp"} ==
               ResponseMetadata.cast(response_metadata)
    end

    @tag :unit
    test "passes through timestamps that are not strings" do
      response_metadata = %{"timestamp" => 0}
      assert %ResponseMetadata{timestamp: 0} == ResponseMetadata.cast(response_metadata)
    end

    @tag :unit
    test "casts nil as nil" do
      assert nil == ResponseMetadata.cast(nil)
    end
  end
end

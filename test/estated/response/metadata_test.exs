defmodule Estated.Response.MetadataTest do
  use ExUnit.Case, async: true

  alias Estated.Response.Metadata

  doctest Metadata

  describe "cast/1" do
    @tag :unit
    test "casts a map as Metadata" do
      response_metadata = %{
        "timestamp" => "2019-12-04T22:22:10.009910Z",
        "version" => "0.4.2-1.8.2",
        "ignore me" => nil
      }

      assert %Metadata{
               timestamp: ~U[2019-12-04T22:22:10.009910Z],
               version: "0.4.2-1.8.2"
             } == Metadata.cast(response_metadata)
    end

    @tag :unit
    test "casts nil as nil" do
      assert nil == Metadata.cast(nil)
    end
  end
end

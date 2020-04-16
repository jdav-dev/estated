defmodule Estated.ResponseTest do
  use ExUnit.Case, async: true

  alias Estated.Error
  alias Estated.Property
  alias Estated.Response
  alias Estated.ResponseMetadata
  alias Estated.Warning

  doctest Response

  describe "cast/1" do
    @tag :unit
    test "casts a map as a Response" do
      response = %{
        "data" => %{},
        "error" => %{},
        "metadata" => %{},
        "warnings" => [%{}],
        "ignore me" => nil
      }

      assert %Response{
               data: %Property{},
               error: %Error{},
               metadata: %ResponseMetadata{},
               warnings: [%Warning{}]
             } == Response.cast(response)
    end

    @tag :unit
    test "casts nil as nil" do
      assert nil == Response.cast(nil)
    end
  end
end

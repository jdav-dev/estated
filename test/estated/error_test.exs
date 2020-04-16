defmodule Estated.ErrorTest do
  use ExUnit.Case, async: true

  alias Estated.Error

  doctest Error

  describe "cast/1" do
    @tag :unit
    test "casts a map as an Error" do
      error = %{
        "code" => "APE01",
        "status_code" => 500,
        "title" => "Internal Server Error",
        "description" => "An exception occurred when attempting to process your request",
        "metadata" => %{},
        "ignore me" => nil
      }

      assert %Error{
               code: "APE01",
               status_code: 500,
               title: "Internal Server Error",
               description: "An exception occurred when attempting to process your request",
               metadata: %{}
             } == Error.cast(error)
    end

    @tag :unit
    test "casts error as nil" do
      assert nil == Error.cast(nil)
    end
  end
end

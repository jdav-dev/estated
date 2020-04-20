defmodule Estated.Property.OwnerTest do
  use ExUnit.Case, async: true

  alias Estated.Property.Owner

  doctest Owner

  describe "cast/1" do
    @tag :unit
    test "casts a map as an Owner" do
      owner = %{
        "name" => "SMITH, JOHN; SMITH, JANE",
        "formatted_street_address" => "123 MAIN ST",
        "unit_type" => "APT",
        "unit_number" => "104",
        "city" => "ATLANTA",
        "state" => "GA",
        "zip_code" => "30342",
        "zip_plus_four_code" => "3019",
        "owner_occupied" => "YES",
        "ignore me" => nil
      }

      assert %Owner{
               name: "SMITH, JOHN; SMITH, JANE",
               formatted_street_address: "123 MAIN ST",
               unit_type: "APT",
               unit_number: "104",
               city: "ATLANTA",
               state: "GA",
               zip_code: "30342",
               zip_plus_four_code: "3019",
               owner_occupied: "YES"
             } == Owner.cast(owner)
    end

    @tag :unit
    test "casts nil as nil" do
      assert nil == Owner.cast(nil)
    end
  end
end

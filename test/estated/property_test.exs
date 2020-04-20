defmodule Estated.PropertyTest do
  use ExUnit.Case, async: true

  alias Estated.Property
  alias Estated.Property.Address
  alias Estated.Property.Assessment
  alias Estated.Property.Deed
  alias Estated.Property.MarketAssessment
  alias Estated.Property.Metadata
  alias Estated.Property.Owner
  alias Estated.Property.Parcel
  alias Estated.Property.Structure
  alias Estated.Property.Tax
  alias Estated.Property.Valuation

  doctest Property

  describe "cast/1" do
    @tag :unit
    test "casts a map as a Property" do
      property = %{
        "metadata" => %{},
        "address" => %{},
        "parcel" => %{},
        "structure" => %{},
        "taxes" => [%{}],
        "assessments" => [%{}],
        "market_assessments" => [%{}],
        "valuation" => %{},
        "owner" => %{},
        "deeds" => [%{}],
        "ignore me" => nil
      }

      assert %Property{
               metadata: %Metadata{},
               address: %Address{},
               parcel: %Parcel{},
               structure: %Structure{},
               taxes: [%Tax{}],
               assessments: [%Assessment{}],
               market_assessments: [%MarketAssessment{}],
               valuation: %Valuation{},
               owner: %Owner{},
               deeds: [%Deed{}]
             } == Property.cast(property)
    end

    @tag :unit
    test "casts nil as nil" do
      assert nil == Property.cast(nil)
    end
  end
end

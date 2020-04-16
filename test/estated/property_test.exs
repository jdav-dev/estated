defmodule Estated.PropertyTest do
  use ExUnit.Case, async: true

  alias Estated.Address
  alias Estated.Assessment
  alias Estated.Deed
  alias Estated.MarketAssessment
  alias Estated.Owner
  alias Estated.Parcel
  alias Estated.Property
  alias Estated.PropertyMetadata
  alias Estated.Structure
  alias Estated.Tax
  alias Estated.Valuation

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
               metadata: %PropertyMetadata{},
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

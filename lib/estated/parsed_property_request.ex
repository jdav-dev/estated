defmodule Estated.ParsedPropertyRequest do
  @moduledoc "Request a property with an address fully parsed into its elements."
  @moduledoc since: "0.1.0"

  alias Estated.Address

  @enforce_keys [:street_name, :city, :state]
  defstruct [
    :street_number,
    :street_pre_direction,
    :street_name,
    :street_suffix,
    :street_post_direction,
    :unit_type,
    :unit_number,
    :city,
    :state,
    :zip_code
  ]

  @typedoc "Request a property with an address fully parsed into its elements."
  @typedoc since: "0.1.0"
  @type t :: %__MODULE__{
          street_number: Address.street_number() | nil,
          street_pre_direction: Address.street_pre_direction() | nil,
          street_name: Address.street_name(),
          street_suffix: Address.street_suffix() | nil,
          street_post_direction: Address.street_post_direction() | nil,
          unit_type: Address.unit_type() | nil,
          unit_number: Address.unit_number() | nil,
          city: Address.city(),
          state: Address.state(),
          zip_code: Address.zip_code() | nil
        }
end

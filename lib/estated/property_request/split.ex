defmodule Estated.PropertyRequest.Split do
  @moduledoc """
  Request a property with a combined street address and a separate city, state, and zip code.
  """
  @moduledoc since: "0.2.0"

  alias Estated.Property.Address

  @enforce_keys [:street_address, :city, :state]
  defstruct [
    :street_address,
    :city,
    :state,
    :zip_code
  ]

  @typedoc """
  Request a property with a combined street address and a separate city, state, and zip code.
  """
  @typedoc since: "0.2.0"
  @type t :: %__MODULE__{
          street_address: street_address(),
          city: Address.city(),
          state: Address.state(),
          zip_code: Address.zip_code() | nil
        }

  @typedoc """
  Full street address.

  Eg. **1101 Sloan St**
  """
  @typedoc since: "0.2.0"
  @type street_address :: String.t()
end

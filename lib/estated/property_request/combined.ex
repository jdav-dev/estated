defmodule Estated.PropertyRequest.Combined do
  @moduledoc "Request a property with address in a single `t:String.t/0`."
  @moduledoc since: "0.2.0"

  @enforce_keys [:combined_address]
  defstruct [
    :combined_address
  ]

  @typedoc "Request a property with address in a single `t:String.t/0`."
  @typedoc since: "0.2.0"
  @type t :: %__MODULE__{
          combined_address: combined_address()
        }

  @typedoc """
  Address elements in a `t:String.t/0`, separated by commas.

  Eg. **1101 Sloan St, Scranton, PA 18504**
  """
  @typedoc since: "0.2.0"
  @type combined_address :: String.t()
end

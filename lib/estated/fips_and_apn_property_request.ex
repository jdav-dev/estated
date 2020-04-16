defmodule Estated.FipsAndApnPropertyRequest do
  @moduledoc "Request a property with both a FIPS code and APN."
  @moduledoc since: "0.1.0"

  alias Estated.Parcel

  @enforce_keys [:fips, :apn]
  defstruct [
    :fips,
    :apn
  ]

  @typedoc "Request a property with both a FIPS code and APN."
  @typedoc since: "0.1.0"
  @type t :: %__MODULE__{
          fips: Parcel.fips_code(),
          apn: Parcel.apn_original() | Parcel.apn_unformatted()
        }
end

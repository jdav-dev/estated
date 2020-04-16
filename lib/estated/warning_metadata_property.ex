defmodule Estated.WarningMetadataProperty do
  @moduledoc """
  Part of a multiple property found warning.

  Includes a FIPS code and APN that can be used for subsequent property requests.
  """
  @moduledoc since: "0.1.0"

  alias Estated.Parcel

  defstruct [
    :fips,
    :apn
  ]

  @typedoc """
  Part of a multiple property found warning.

  Includes a FIPS code and APN that can be used for subsequent property requests.
  """
  @typedoc since: "0.1.0"
  @type t :: %__MODULE__{
          fips: Parcel.fips_code() | nil,
          apn: Parcel.apn_original() | nil
        }

  def cast(properties) when is_list(properties) do
    Enum.map(properties, &cast/1)
  end

  def cast(%{} = properties) do
    Enum.reduce(properties, %__MODULE__{}, fn
      {"fips", fips}, acc -> %__MODULE__{acc | fips: fips}
      {"apn", apn}, acc -> %__MODULE__{acc | apn: apn}
      _, acc -> acc
    end)
  end
end

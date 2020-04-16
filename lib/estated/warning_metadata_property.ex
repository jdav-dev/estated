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

  @doc false
  @doc since: "0.1.0"
  @spec cast_list([map()]) :: [t()]
  def cast_list(warning_metadata_properties) when is_list(warning_metadata_properties) do
    Enum.map(warning_metadata_properties, &cast/1)
  end

  @spec cast_list(nil) :: []
  def cast_list(nil) do
    []
  end

  defp cast(%{} = warning_metadata_property) do
    Enum.reduce(warning_metadata_property, %__MODULE__{}, fn
      {"fips", fips}, acc -> %__MODULE__{acc | fips: fips}
      {"apn", apn}, acc -> %__MODULE__{acc | apn: apn}
      _, acc -> acc
    end)
  end
end

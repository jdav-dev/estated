defmodule Estated.Warning.Metadata.Property do
  @moduledoc """
  Part of a multiple property found warning.

  Includes a FIPS code and APN that can be used for subsequent property requests.
  """
  @moduledoc since: "0.2.0"

  alias Estated.Property.Parcel

  defstruct [
    :fips,
    :apn
  ]

  @typedoc """
  Part of a multiple property found warning.

  Includes a FIPS code and APN that can be used for subsequent property requests.
  """
  @typedoc since: "0.2.0"
  @type t :: %__MODULE__{
          fips: Parcel.fips_code() | nil,
          apn: Parcel.apn_original() | nil
        }

  @doc false
  @doc since: "0.2.0"
  @spec cast_list([map()]) :: [t()]
  def cast_list(warning_metadata_properties) when is_list(warning_metadata_properties) do
    Enum.map(warning_metadata_properties, &cast/1)
  end

  @spec cast_list(nil) :: []
  def cast_list(nil) do
    []
  end

  defp cast(%{} = warning_metadata_property) do
    Enum.reduce(warning_metadata_property, %__MODULE__{}, &cast_field/2)
  end

  defp cast_field({"fips", fips}, acc) do
    %__MODULE__{acc | fips: fips}
  end

  defp cast_field({"apn", apn}, acc) do
    %__MODULE__{acc | apn: apn}
  end

  defp cast_field(_map_entry, acc) do
    acc
  end
end

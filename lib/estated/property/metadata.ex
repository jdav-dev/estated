defmodule Estated.Property.Metadata do
  @moduledoc "Metadata related to the property."
  @moduledoc since: "0.2.0"

  import Estated.CastHelpers, only: [cast_date: 1]

  defstruct [
    :publishing_date
  ]

  @typedoc "Metadata related to the property."
  @typedoc since: "0.2.0"
  @type t :: %__MODULE__{
          publishing_date: publishing_date() | nil
        }

  @typedoc """
  The date the data was made available at the source.

  Eg. **2018-02-14**
  """
  @typedoc since: "0.2.0"
  @type publishing_date :: Date.t()

  @doc false
  @doc since: "0.2.0"
  @spec cast(map()) :: t()
  def cast(%{} = property_metadata) do
    Enum.reduce(property_metadata, %__MODULE__{}, &cast_field/2)
  end

  @spec cast(nil) :: nil
  def cast(nil) do
    nil
  end

  defp cast_field({"publishing_date", publishing_date}, acc) do
    %__MODULE__{acc | publishing_date: cast_date(publishing_date)}
  end

  defp cast_field(_map_entry, acc) do
    acc
  end
end

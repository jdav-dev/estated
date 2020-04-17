defmodule Estated.ResponseMetadata do
  @moduledoc "Metadata related to the request."
  @moduledoc since: "0.1.0"

  import Estated.CastHelpers, only: [cast_datetime: 1]

  defstruct [
    :timestamp,
    :version
  ]

  @typedoc "Metadata related to the request."
  @typedoc since: "0.1.0"
  @type t :: %__MODULE__{
          timestamp: DateTime.t() | nil,
          version: String.t() | nil
        }

  @doc false
  @doc since: "0.1.0"
  @spec cast(map()) :: t()
  def cast(%{} = response_metadata) do
    Enum.reduce(response_metadata, %__MODULE__{}, &cast_field/2)
  end

  @spec cast(nil) :: nil
  def cast(nil) do
    nil
  end

  defp cast_field({"timestamp", timestamp}, acc) do
    %__MODULE__{acc | timestamp: cast_datetime(timestamp)}
  end

  defp cast_field({"version", version}, acc) do
    %__MODULE__{acc | version: version}
  end

  defp cast_field(_map_entry, acc) do
    acc
  end
end

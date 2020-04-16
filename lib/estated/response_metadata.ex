defmodule Estated.ResponseMetadata do
  @moduledoc "Metadata related to the request."
  @moduledoc since: "0.1.0"

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
    Enum.reduce(response_metadata, %__MODULE__{}, fn
      {"timestamp", timestamp}, acc ->
        %__MODULE__{acc | timestamp: cast_timestamp(timestamp)}

      {"version", version}, acc ->
        %__MODULE__{acc | version: version}

      _, acc ->
        acc
    end)
  end

  @spec cast(nil) :: nil
  def cast(nil) do
    nil
  end

  defp cast_timestamp(timestamp) when is_binary(timestamp) do
    case DateTime.from_iso8601(timestamp) do
      {:ok, datetime, _utc_offset} -> datetime
      {:error, _reason} -> timestamp
    end
  end

  defp cast_timestamp(timestamp) do
    timestamp
  end
end

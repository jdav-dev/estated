defmodule Estated.PropertyMetadata do
  @moduledoc "Metadata related to the property."
  @moduledoc since: "0.1.0"

  defstruct [
    :publishing_date
  ]

  @typedoc "Metadata related to the property."
  @typedoc since: "0.1.0"
  @type t :: %__MODULE__{
          publishing_date: publishing_date() | nil
        }

  @typedoc "The date the data was made available at the source."
  @typedoc since: "0.1.0"
  @type publishing_date :: Date.t()

  def cast(%{} = metadata) do
    Enum.reduce(metadata, %__MODULE__{}, fn
      {"publishing_date", publishing_date}, acc ->
        %__MODULE__{acc | publishing_date: cast_date(publishing_date)}

      _, acc ->
        acc
    end)
  end

  defp cast_date(date_string) when is_binary(date_string) do
    case Date.from_iso8601(date_string) do
      {:ok, date} -> date
      {:error, _reason} -> date_string
    end
  end

  defp cast_date(date) do
    date
  end
end

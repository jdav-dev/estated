defmodule Estated.Response do
  @moduledoc """
  The top-level response from the Estated v4 API.

  Successful responses include a property record, metadata, and a list of warnings.  Warning
  responses include metadata, one or more warnings, and maybe a property record.  Error responses
  include an error and metadata.

  In the event of multiple properties found for a given request, the API will return a warning
  code of `"PW02"`, multiple properties found.  The `metadata` of the `warning` will include a
  list of APN and FIPS codes that can be used for subsequent property requests.
  """
  @moduledoc since: "0.1.0"

  alias Estated.Error
  alias Estated.Property
  alias Estated.ResponseMetadata
  alias Estated.Warning

  defstruct data: nil,
            error: nil,
            metadata: nil,
            warnings: []

  @typedoc "Top-level response."
  @typedoc since: "0.1.0"
  @type t :: %__MODULE__{
          data: Property.t() | nil,
          error: Error.t() | nil,
          metadata: ResponseMetadata.t() | nil,
          warnings: [Warning.t()]
        }

  @doc false
  @doc since: "0.1.0"
  @spec cast(map()) :: t()
  def cast(%{} = response) do
    Enum.reduce(response, %__MODULE__{}, &cast_field/2)
  end

  @spec cast(nil) :: nil
  def cast(nil) do
    nil
  end

  defp cast_field({"data", data}, acc) do
    %__MODULE__{acc | data: Property.cast(data)}
  end

  defp cast_field({"error", error}, acc) do
    %__MODULE__{acc | error: Error.cast(error)}
  end

  defp cast_field({"metadata", metadata}, acc) do
    %__MODULE__{acc | metadata: ResponseMetadata.cast(metadata)}
  end

  defp cast_field({"warnings", warnings}, acc) do
    %__MODULE__{acc | warnings: Warning.cast_list(warnings)}
  end

  defp cast_field(_map_entry, acc) do
    acc
  end
end

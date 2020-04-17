defmodule Estated.WarningMetadata do
  @moduledoc "Metadata related to the warning."
  @moduledoc since: "0.1.0"

  alias Estated.WarningMetadataProperty

  defstruct properties: []

  @typedoc "Metadata related to the warning."
  @typedoc since: "0.1.0"
  @type t :: %__MODULE__{
          properties: [WarningMetadataProperty.t()]
        }

  @doc false
  @doc since: "0.1.0"
  @spec cast(map()) :: t()
  def cast(%{} = warning_metadata) do
    Enum.reduce(warning_metadata, %__MODULE__{}, &cast_field/2)
  end

  @spec cast(nil) :: nil
  def cast(nil) do
    nil
  end

  defp cast_field({"properties", properties}, acc) do
    %__MODULE__{acc | properties: WarningMetadataProperty.cast_list(properties)}
  end

  defp cast_field(_map_entry, acc) do
    acc
  end
end

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
    Enum.reduce(warning_metadata, %__MODULE__{}, fn
      {"properties", properties}, acc ->
        %__MODULE__{acc | properties: WarningMetadataProperty.cast_list(properties)}

      _, acc ->
        acc
    end)
  end

  @spec cast(nil) :: nil
  def cast(nil) do
    nil
  end
end

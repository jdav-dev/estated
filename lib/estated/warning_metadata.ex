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

  def cast(%{} = metadata) do
    Enum.reduce(metadata, %__MODULE__{}, fn
      {"properties", properties}, acc ->
        %__MODULE__{acc | properties: WarningMetadataProperty.cast(properties)}

      _, acc ->
        acc
    end)
  end
end

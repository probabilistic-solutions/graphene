defmodule Graphene.CarbonComponents.Layer do
  @moduledoc false

  use Phoenix.Component

  alias Graphene.Internal.CoreComponents

  @doc """
  Component `<cds-layer>` from `./src/components/layer/layer.ts`

  Basic layer

  ## Events

  * `cds-use-layer` - The custom event that returns the layer level and the layer element.

  """
  attr :layers, :any

  attr :level, :string,
    doc: "Specify the layer level and override any existing levels based on hierarchy",
    default: "0"

  attr :with_background, :any
  attr :rest, :global
  slot :children, doc: "The elements contained within the component."
  slot :inner_block

  def layer(assigns) do
    CoreComponents.layer(assigns)
  end
end

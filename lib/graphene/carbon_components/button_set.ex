defmodule Graphene.CarbonComponents.ButtonSet do
  @moduledoc false

  use Phoenix.Component

  alias Graphene.Internal.CoreComponents

  @doc """
  Component `<cds-button-set>` from `./src/components/button/button-set.ts`

  Button set.


  """
  attr :stacked, :boolean,
    doc: "`true` if the buttons should be stacked. Only applies to the button-set variant."

  attr :rest, :global
  slot :inner_block

  def button_set(assigns) do
    CoreComponents.button_set(assigns)
  end

  @doc """
  Component `<cds-button-set-base>` from `./src/components/button/button-set-base.ts`

  Button set without button checks


  """
  attr :rest, :global
  slot :inner_block

  def button_set_base(assigns) do
    CoreComponents.button_set_base(assigns)
  end
end

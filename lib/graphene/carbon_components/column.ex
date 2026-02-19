defmodule Graphene.CarbonComponents.Column do
  @moduledoc false

  use Phoenix.Component

  alias Graphene.Internal.CoreComponents

  @doc """
  Component `<cds-column>` from `./src/components/grid/column.ts`

  The column component.


  """
  attr :lg, :any
  attr :md, :any

  attr :sm, :any,
    doc:
      "Specify column size\nKeys sm, md or lg\n\nValues\n- N, P, { span:N start:S}, { start: S, end: E}\nN = number\nP = percentage\nS = Start column\nE = End column (does not reach e.g. start 1 end 3 is same as start 1 span 2)"

  attr :span, :any
  attr :rest, :global
  slot :inner_block

  def column(assigns) do
    CoreComponents.column(assigns)
  end

  @doc """
  Component `<cds-column-hang>` from `./src/components/grid/column-hang.ts`

  The column component.


  """
  attr :rest, :global
  slot :inner_block

  def column_hang(assigns) do
    CoreComponents.column_hang(assigns)
  end
end

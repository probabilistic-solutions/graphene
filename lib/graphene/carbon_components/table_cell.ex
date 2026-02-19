defmodule Graphene.CarbonComponents.TableCell do
  @moduledoc false

  use Phoenix.Component

  alias Graphene.Internal.CoreComponents

  @doc """
  Component `<cds-table-cell>` from `./src/components/data-table/table-cell.ts`

  Data table cell.


  """
  attr :overflow_menu_on_hover, :boolean,
    doc:
      "Specify whether the overflow menu (if it exists) should be shown always, or only on hover"

  attr :size, :any, doc: "The table size."
  attr :rest, :global
  slot :inner_block

  def table_cell(assigns) do
    CoreComponents.table_cell(assigns)
  end

  @doc """
  Component `<cds-table-cell-content>` from `./src/components/data-table/table-cell-content.ts`

  Data table cell content.


  """
  attr :rest, :global
  slot :inner_block

  def table_cell_content(assigns) do
    CoreComponents.table_cell_content(assigns)
  end
end

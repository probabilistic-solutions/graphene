Code.require_file(Path.join(__DIR__, "shared.exs"))
defmodule Storybook.BasicComponents.Table.OverflowMenuSmall do
  use PhoenixStorybook.Story, :example

  import Graphene.BasicComponents
  alias Graphene.CarbonComponents, as: Carbon

  alias Storybook.BasicComponents.Table.Shared, as: TableData

  def doc do
    "Small table with overflow menu actions."
  end

  @impl true
  def render(assigns) do
    assigns = assign(assigns, rows: TableData.rows(), columns: TableData.columns())

    ~H"""
    <.table
      id="overflow-menu-small-table"
      rows={@rows}
      row_id={&TableData.row_id/1}
      size="sm"
      overflow_menu_on_hover={true}
    >
      <:title>DataTable</:title>
      <:description>Small overflow menu</:description>
      <:toolbar>
        <Carbon.table_toolbar>
          <Carbon.table_toolbar_content>
            <Carbon.table_toolbar_search placeholder="Filter table" />
            <.button>Primary button</.button>
          </Carbon.table_toolbar_content>
        </Carbon.table_toolbar>
      </:toolbar>

      <:col :for={col <- @columns} :let={row} label={col.label}>
        <%= Map.get(row, col.key) %>
      </:col>

      <:action :let={_row}>
        <Carbon.overflow_menu toolbar_action flipped>
          <:icon><%= TableData.overflow_menu_icon() %></:icon>
          <:tooltip_content>Options</:tooltip_content>
          <:item label="Stop app" />
          <:item label="Restart app" />
          <:item label="Rename" />
        </Carbon.overflow_menu>
      </:action>
    </.table>
    """
  end
end

Code.require_file(Path.join(__DIR__, "shared.exs"))
defmodule Storybook.BasicComponents.Table.ToolbarPersistent do
  use PhoenixStorybook.Story, :example

  import Graphene.BasicComponents
  alias Graphene.CarbonComponents, as: Carbon

  alias Storybook.BasicComponents.Table.Shared, as: TableData

  def doc do
    "Table with persistent toolbar search."
  end

  @impl true
  def render(assigns) do
    assigns = assign(assigns, rows: TableData.rows(), columns: TableData.columns())

    ~H"""
    <.table id="persistent-toolbar-table" rows={@rows} row_id={&TableData.row_id/1}>
      <:title>DataTable</:title>
      <:description>With persistent toolbar</:description>
      <:toolbar>
        <Carbon.table_toolbar>
          <Carbon.table_toolbar_content>
            <Carbon.table_toolbar_search persistent placeholder="Filter table" />
            <Carbon.overflow_menu toolbar_action>
              <:icon><%= TableData.overflow_menu_icon() %></:icon>
              <:tooltip_content>Settings</:tooltip_content>
              <:item label="Action 1" />
              <:item label="Action 2" />
              <:item label="Action 3" />
            </Carbon.overflow_menu>
            <.button>Primary button</.button>
          </Carbon.table_toolbar_content>
        </Carbon.table_toolbar>
      </:toolbar>

      <:col :for={col <- @columns} :let={row} label={col.label}>
        <%= Map.get(row, col.key) %>
      </:col>
    </.table>
    """
  end
end

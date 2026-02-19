Code.require_file(Path.join(__DIR__, "shared.exs"))
defmodule Storybook.BasicComponents.Table.BatchActions do
  use PhoenixStorybook.Story, :example
  use Graphene, [:html, :live]
  alias Graphene.CarbonComponents, as: Carbon

  alias Storybook.BasicComponents.Table.Shared, as: TableData

  def doc do
    "Table with batch actions in the toolbar."
  end

  @impl true
  def render(assigns) do
    assigns = assign(assigns, rows: TableData.rows(), columns: TableData.columns())

    ~H"""
    <.table
      id="batch-actions-table"
      rows={@rows}
      row_id={&TableData.row_id/1}
      selectable={true}
      selection_name="batch-actions"
    >
      <:title>DataTable</:title>
      <:description>With batch actions</:description>
      <:toolbar>
        <Carbon.table_toolbar>
          <Carbon.table_batch_actions total_rows_count="6">
            <.button kind="ghost">Delete</.button>
            <.button kind="ghost">Save</.button>
            <.button kind="ghost" href="#">Download</.button>
          </Carbon.table_batch_actions>
          <Carbon.table_toolbar_content has_batch_actions>
            <Carbon.table_toolbar_search placeholder="Filter table" />
            <Carbon.overflow_menu toolbar_action>
              <:icon><%= TableData.overflow_menu_icon() %></:icon>
              <:tooltip_content>Settings</:tooltip_content>
              <:item label="Action 1" />
              <:item label="Action 2" />
              <:item label="Action 3" />
            </Carbon.overflow_menu>
            <.button>Add new</.button>
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

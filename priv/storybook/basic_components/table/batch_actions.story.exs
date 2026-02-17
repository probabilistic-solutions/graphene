Code.require_file(Path.join(__DIR__, "shared.exs"))
defmodule Storybook.BasicComponents.Table.BatchActions do
  use PhoenixStorybook.Story, :example

  import Graphene.BasicComponents

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
        <cds-table-toolbar>
          <cds-table-batch-actions total-rows-count="6">
            <.button kind="ghost">Delete</.button>
            <.button kind="ghost">Save</.button>
            <.button kind="ghost" href="#">Download</.button>
          </cds-table-batch-actions>
          <cds-table-toolbar-content has-batch-actions>
            <cds-table-toolbar-search placeholder="Filter table"></cds-table-toolbar-search>
            <cds-overflow-menu toolbar-action>
              <%= TableData.overflow_menu_icon() %>
              <span slot="tooltip-content">Settings</span>
              <cds-overflow-menu-body>
                <cds-overflow-menu-item>Action 1</cds-overflow-menu-item>
                <cds-overflow-menu-item>Action 2</cds-overflow-menu-item>
                <cds-overflow-menu-item>Action 3</cds-overflow-menu-item>
              </cds-overflow-menu-body>
            </cds-overflow-menu>
            <.button>Add new</.button>
          </cds-table-toolbar-content>
        </cds-table-toolbar>
      </:toolbar>

      <:col :for={col <- @columns} :let={row} label={col.label}>
        <%= Map.get(row, col.key) %>
      </:col>
    </.table>
    """
  end
end

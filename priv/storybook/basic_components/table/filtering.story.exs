Code.require_file(Path.join(__DIR__, "shared.exs"))
defmodule Storybook.BasicComponents.Table.Filtering do
  use PhoenixStorybook.Story, :example

  import Graphene.BasicComponents

  alias Storybook.BasicComponents.Table.Shared, as: TableData

  def doc do
    "Table with filtering toolbar."
  end

  @impl true
  def render(assigns) do
    assigns = assign(assigns, rows: TableData.rows(), columns: TableData.columns())

    ~H"""
    <.table id="filtering-table" rows={@rows} row_id={&TableData.row_id/1}>
      <:title>DataTable</:title>
      <:description>With filtering</:description>
      <:toolbar>
        <cds-table-toolbar>
          <cds-table-toolbar-content>
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
            <.button>Primary button</.button>
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

Code.require_file(Path.join(__DIR__, "shared.exs"))
defmodule Storybook.BasicComponents.Table.OverflowMenuSmall do
  use PhoenixStorybook.Story, :example

  import Graphene.BasicComponents

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
        <cds-table-toolbar>
          <cds-table-toolbar-content>
            <cds-table-toolbar-search placeholder="Filter table"></cds-table-toolbar-search>
            <.button>Primary button</.button>
          </cds-table-toolbar-content>
        </cds-table-toolbar>
      </:toolbar>

      <:col :for={col <- @columns} :let={row} label={col.label}>
        <%= Map.get(row, col.key) %>
      </:col>

      <:action :let={_row}>
        <cds-overflow-menu toolbar-action>
          <%= TableData.overflow_menu_icon() %>
          <span slot="tooltip-content">Options</span>
          <cds-overflow-menu-body flipped>
            <cds-overflow-menu-item>Stop app</cds-overflow-menu-item>
            <cds-overflow-menu-item>Restart app</cds-overflow-menu-item>
            <cds-overflow-menu-item>Rename</cds-overflow-menu-item>
          </cds-overflow-menu-body>
        </cds-overflow-menu>
      </:action>
    </.table>
    """
  end
end

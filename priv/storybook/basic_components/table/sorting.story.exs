Code.require_file(Path.join(__DIR__, "shared.exs"))
defmodule Storybook.BasicComponents.Table.Sorting do
  use PhoenixStorybook.Story, :example

  import Graphene.BasicComponents

  alias Storybook.BasicComponents.Table.Shared, as: TableData

  def doc do
    "Table with sortable headers."
  end

  @impl true
  def render(assigns) do
    assigns = assign(assigns, rows: TableData.rows(), columns: TableData.columns())

    ~H"""
    <.table
      id="sorting-table"
      rows={@rows}
      row_id={&TableData.row_id/1}
      sortable={true}
    >
      <:title>DataTable</:title>
      <:description>With sorting</:description>

      <:col :for={col <- @columns} :let={row} label={col.label}>
        <%= Map.get(row, col.key) %>
      </:col>
    </.table>
    """
  end
end

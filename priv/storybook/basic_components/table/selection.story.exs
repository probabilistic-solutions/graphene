Code.require_file(Path.join(__DIR__, "shared.exs"))
defmodule Storybook.BasicComponents.Table.Selection do
  use PhoenixStorybook.Story, :example
  use Graphene, [:html, :live]

  alias Storybook.BasicComponents.Table.Shared, as: TableData

  def doc do
    "Table with checkbox selection and header actions."
  end

  @impl true
  def render(assigns) do
    assigns = assign(assigns, rows: TableData.rows(), columns: TableData.columns())

    ~H"""
    <.table
      id="selection-table"
      rows={@rows}
      row_id={&TableData.row_id/1}
      selectable={true}
      selection_name="selection-table"
    >
      <:title>DataTable</:title>
      <:description>With selection</:description>

      <:col :for={col <- @columns} :let={row} label={col.label}>
        <%= Map.get(row, col.key) %>
      </:col>
    </.table>
    """
  end
end

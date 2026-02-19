Code.require_file(Path.join(__DIR__, "shared.exs"))
defmodule Storybook.BasicComponents.Table.SelectionRadio do
  use PhoenixStorybook.Story, :example
  use Graphene, [:html, :live]

  alias Storybook.BasicComponents.Table.Shared, as: TableData

  def doc do
    "Table with radio selection."
  end

  @impl true
  def render(assigns) do
    assigns = assign(assigns, rows: TableData.rows(), columns: TableData.columns())

    ~H"""
    <.table
      id="radio-selection-table"
      rows={@rows}
      row_id={&TableData.row_id/1}
      selectable={true}
      radio={true}
      selection_name="radio-selection"
    >
      <:title>DataTable</:title>
      <:description>With radio selection</:description>

      <:col :for={col <- @columns} :let={row} label={col.label}>
        <%= Map.get(row, col.key) %>
      </:col>
    </.table>
    """
  end
end

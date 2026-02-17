Code.require_file(Path.join(__DIR__, "shared.exs"))
defmodule Storybook.BasicComponents.Table.SelectionRadioSorting do
  use PhoenixStorybook.Story, :example

  import Graphene.BasicComponents

  alias Storybook.BasicComponents.Table.Shared, as: TableData

  def doc do
    "Table with radio selection and sorting."
  end

  @impl true
  def render(assigns) do
    assigns = assign(assigns, rows: TableData.rows(), columns: TableData.columns())

    ~H"""
    <.table
      id="radio-selection-sorting-table"
      rows={@rows}
      row_id={&TableData.row_id/1}
      selectable={true}
      sortable={true}
      radio={true}
      selection_name="radio-selection-sorting"
    >
      <:title>DataTable</:title>
      <:description>With radio selection and sorting</:description>

      <:col :for={col <- @columns} :let={row} label={col.label}>
        <%= Map.get(row, col.key) %>
      </:col>
    </.table>
    """
  end
end

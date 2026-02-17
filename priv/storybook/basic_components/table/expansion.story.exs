Code.require_file(Path.join(__DIR__, "shared.exs"))
defmodule Storybook.BasicComponents.Table.Expansion do
  use PhoenixStorybook.Story, :example

  import Graphene.BasicComponents

  alias Storybook.BasicComponents.Table.Shared, as: TableData

  def doc do
    "Table with expandable rows."
  end

  @impl true
  def render(assigns) do
    assigns = assign(assigns, rows: TableData.rows(), columns: TableData.columns())

    ~H"""
    <.table
      id="expansion-table"
      rows={@rows}
      row_id={&TableData.row_id/1}
      expandable={true}
    >
      <:title>DataTable</:title>
      <:description>With expansion</:description>

      <:col :for={col <- @columns} :let={row} label={col.label}>
        <%= Map.get(row, col.key) %>
      </:col>

      <:expanded_row :let={row}>
        <h6>Expandable row content</h6>
        <div><%= TableData.expanded_content(row) %></div>
      </:expanded_row>
    </.table>
    """
  end
end

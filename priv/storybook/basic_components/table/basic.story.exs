Code.require_file(Path.join(__DIR__, "shared.exs"))
defmodule Storybook.BasicComponents.Table.Basic do
  use PhoenixStorybook.Story, :example
  use Graphene, [:html, :live]

  alias Storybook.BasicComponents.Table.Shared, as: TableData

  def doc do
    "Basic table using Graphene.BasicComponents.table."
  end

  @impl true
  def render(assigns) do
    assigns = assign(assigns, rows: TableData.rows(), columns: TableData.columns())

    ~H"""
    <.table id="basic-table" rows={@rows} row_id={&TableData.row_id/1}>
      <:col :for={col <- @columns} :let={row} label={col.label}>
        <%= Map.get(row, col.key) %>
      </:col>
    </.table>
    """
  end
end

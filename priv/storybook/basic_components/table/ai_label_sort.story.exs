Code.require_file(Path.join(__DIR__, "shared.exs"))
defmodule Storybook.BasicComponents.Table.AILabelSort do
  use PhoenixStorybook.Story, :example

  import Graphene.BasicComponents

  alias Storybook.BasicComponents.Table.Shared, as: TableData

  def doc do
    "Sortable table with AI label in a header column."
  end

  @impl true
  def render(assigns) do
    assigns =
      assigns
      |> assign(:rows, TableData.rows())
      |> assign(
        :columns,
        TableData.columns()
        |> Enum.map(fn col ->
          if col.key == :group do
            %{col | label: TableData.ai_label_header_label()}
          else
            col
          end
        end)
      )

    ~H"""
    <.table
      id="ai-label-sort-table"
      rows={@rows}
      row_id={&TableData.row_id/1}
      sortable={true}
    >
      <:title>DataTable</:title>
      <:description>AI label in header with sorting</:description>

      <:col :for={col <- @columns} :let={row} label={col.label}>
        <%= Map.get(row, col.key) %>
      </:col>
    </.table>
    """
  end
end

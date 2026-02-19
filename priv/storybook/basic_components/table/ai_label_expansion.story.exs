Code.require_file(Path.join(__DIR__, "shared.exs"))
defmodule Storybook.BasicComponents.Table.AILabelExpansion do
  use PhoenixStorybook.Story, :example
  use Graphene, [:html, :live]

  alias Storybook.BasicComponents.Table.Shared, as: TableData

  def doc do
    "Expandable table with AI labels in rows."
  end

  @impl true
  def render(assigns) do
    assigns = assign(assigns, rows: TableData.rows(), columns: TableData.columns())

    ~H"""
    <.table
      id="ai-label-expansion-table"
      rows={@rows}
      row_id={&TableData.row_id/1}
      expandable={true}
      batch_expansion={true}
      with_row_ai_labels={true}
    >
      <:title>DataTable</:title>
      <:description>AI labels with expansion</:description>

      <:row_decorator :let={row}>
        <%= if rem(row.id, 2) == 0 do %>
          <%= TableData.ai_label_markup() %>
        <% end %>
      </:row_decorator>

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

Code.require_file(Path.join(__DIR__, "shared.exs"))
defmodule Storybook.CarbonComponents.DataTable.Dynamic do
  use PhoenixStorybook.Story, :example

  import Graphene.CarbonComponents
  def doc do
    """
Dynamic tables update row data over time without a full reload. Use them for
live status, monitoring, or streaming datasets.

Pair .data_table with .inline_loading or subtle indicators to explain updates,
and avoid disruptive re-ordering while users are scanning.
"""
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, rows: Enum.take(Storybook.CarbonComponents.DataTable.Shared.rows(), 3))}
  end

  @impl true
  def render(assigns) do
    assigns = assign(assigns, :columns, Storybook.CarbonComponents.DataTable.Shared.columns())

    ~H"""
    <div class="psb-sandbox">
      <.button phx-click="add-row">Add row</.button>
    </div>

    <.data_table
      id="carbon-dynamic-table"
      rows={@rows}
      row_id={&Graphene.CarbonComponents.DataTable.Shared.row_id/1}
      phx_update={false}
    >
      <:title>DataTable</:title>
      <:description>Dynamic rows</:description>

      <:col :for={col <- @columns} :let={row} label={col.label}>
        <%= Map.get(row, col.key) %>
      </:col>
    </.data_table>
    """
  end

  @impl true
  def handle_event("add-row", _params, socket) do
    rows = socket.assigns.rows
    next_row = Enum.at(Storybook.CarbonComponents.DataTable.Shared.rows(), length(rows))

    rows = if next_row, do: rows ++ [next_row], else: rows

    {:noreply, assign(socket, :rows, rows)}
  end
end

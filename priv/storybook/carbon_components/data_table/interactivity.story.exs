Code.require_file(Path.join(__DIR__, "shared.exs"))

defmodule Storybook.CarbonComponents.DataTable.Interactivity do
  use PhoenixStorybook.Story, :example

  import Graphene.CarbonComponents

  alias Phoenix.LiveView.JS

  def doc do
    "CarbonComponents data table wired with callbacks and simulator events."
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       rows: Storybook.CarbonComponents.DataTable.Shared.rows(),
       logs: []
     )}
  end

  @impl true
  def render(assigns) do
    assigns = assign(assigns, :columns, Storybook.CarbonComponents.DataTable.Shared.columns())

    ~H"""
    <.data_table
      id="carbon-events-table"
      rows={@rows}
      row_id={&Storybook.CarbonComponents.DataTable.Shared.row_id/1}
      selectable={true}
      sortable={true}
      expandable={true}
      batch_expansion={true}
      selection_name="carbon-events"
      with_row_ai_labels={true}
      on_row_selected={event_handler("row_selected")}
      on_row_all_selected={event_handler("row_all_selected")}
      on_sorted={event_handler("sorted")}
      on_filtered={event_handler("filtered")}
      on_search={event_handler("search")}
      on_batch_cancel={event_handler("batch_cancel")}
    >
      <:title>DataTable</:title>
      <:description>Advanced interactivity with callbacks</:description>
      <:toolbar>
        <.table_toolbar>
          <.table_batch_actions total_rows_count="6">
            <.button kind="ghost">Delete</.button>
            <.button kind="ghost">Save</.button>
            <.button kind="ghost" href="#">Download</.button>
          </.table_batch_actions>
          <.table_toolbar_content has_batch_actions>
            <.table_toolbar_search placeholder="Filter table" />
            <.overflow_menu toolbar_action>
              <:icon>
                <Storybook.CarbonComponents.DataTable.Shared.overflow_icon />
              </:icon>
              <:tooltip_content>Settings</:tooltip_content>
              <:item>Action 1</:item>
              <:item>Action 2</:item>
              <:item>Action 3</:item>
            </.overflow_menu>
            <.button>Add new</.button>
          </.table_toolbar_content>
        </.table_toolbar>
      </:toolbar>

      <:row_decorator :let={row}>
        <%= if rem(row.id, 2) == 0 do %>
          <Storybook.CarbonComponents.DataTable.Shared.ai_label />
        <% end %>
      </:row_decorator>

      <:col :let={row} :for={col <- @columns} label={col.label}>
        {Map.get(row, col.key)}
      </:col>

      <:action :let={_row}>
        <.overflow_menu toolbar_action flipped>
          <:icon>
            <Storybook.CarbonComponents.DataTable.Shared.overflow_icon />
          </:icon>
          <:tooltip_content>Options</:tooltip_content>
          <:item>Stop app</:item>
          <:item>Restart app</:item>
          <:item>Rename</:item>
        </.overflow_menu>
      </:action>

      <:expanded_row :let={row}>
        <h6>Expandable row content</h6>
        <div>{Storybook.CarbonComponents.DataTable.Shared.expanded_content(row)}</div>
      </:expanded_row>
    </.data_table>

    <h4>Event log</h4>
    <pre id="carbon-events-log">
      <%= for log <- Enum.reverse(@logs) do %>
        [<%= log.type %>] <%= inspect(log.payload) %>
      <% end %>
    </pre>

    <h4>Callback controls</h4>
    <p>These buttons dispatch the same events as the built-in controls.</p>
    <div id="carbon-events-simulator">
      <%= for {label, detail} <- simulator_events() do %>
        <.button
          kind="tertiary"
          phx-click={
            JS.dispatch(
              "graphene:table-simulate",
              detail: detail,
              to: "#carbon-events-table"
            )
          }
        >
          {label}
        </.button>
      <% end %>
    </div>
    """
  end

  @impl true
  def handle_info({:table_event, type, payload}, socket) do
    {:noreply, log_event(socket, type, payload)}
  end

  defp event_handler(type) do
    fn payload, socket ->
      send(self(), {:table_event, type, payload})
      {:noreply, socket}
    end
  end

  defp log_event(socket, type, payload) do
    update(socket, :logs, fn logs ->
      [%{type: type, payload: payload} | Enum.take(logs, 19)]
    end)
  end

  defp simulator_events do
    [
      {"Select row 2", %{action: "select_row", row_id: "row-2", selected: true}},
      {"Clear selection", %{action: "select_none"}},
      {"Select all", %{action: "select_all", selected: true}},
      {"Sort by name (asc)", %{action: "sort", column_index: 0, direction: "ascending"}},
      {"Sort by name (desc)", %{action: "sort", column_index: 0, direction: "descending"}},
      {"Search 'Balancer 1'", %{action: "search", value: "Balancer 1"}},
      {"Clear search", %{action: "search", value: ""}}
    ]
  end
end

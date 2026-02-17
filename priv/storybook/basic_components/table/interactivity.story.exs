Code.require_file(Path.join(__DIR__, "shared.exs"))
defmodule Storybook.BasicComponents.Table.Interactivity do
  use PhoenixStorybook.Story, :example

  import Graphene.BasicComponents

  alias Phoenix.LiveView.JS
  alias Storybook.BasicComponents.Table.Shared, as: TableData

  def doc do
    "Advanced table wired with callbacks for selection, sorting, filtering, and batch actions."
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       rows: TableData.rows(),
       logs: []
     )}
  end

  @impl true
  def render(assigns) do
    assigns = assign(assigns, :columns, TableData.columns())

    ~H"""
    <.table
      id="advanced-events-table"
      rows={@rows}
      row_id={&TableData.row_id/1}
      selectable={true}
      sortable={true}
      expandable={true}
      batch_expansion={true}
      selection_name="advanced-events"
      with_row_ai_labels={true}
      phx_update="ignore"
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
        <cds-table-toolbar>
          <cds-table-batch-actions total-rows-count="6">
            <.button kind="ghost">Delete</.button>
            <.button kind="ghost">Save</.button>
            <.button kind="ghost" href="#">Download</.button>
          </cds-table-batch-actions>
          <cds-table-toolbar-content has-batch-actions>
            <cds-table-toolbar-search placeholder="Filter table"></cds-table-toolbar-search>
            <cds-overflow-menu toolbar-action>
              <%= TableData.overflow_menu_icon() %>
              <span slot="tooltip-content">Settings</span>
              <cds-overflow-menu-body>
                <cds-overflow-menu-item>Action 1</cds-overflow-menu-item>
                <cds-overflow-menu-item>Action 2</cds-overflow-menu-item>
                <cds-overflow-menu-item>Action 3</cds-overflow-menu-item>
              </cds-overflow-menu-body>
            </cds-overflow-menu>
            <.button>Add new</.button>
          </cds-table-toolbar-content>
        </cds-table-toolbar>
      </:toolbar>

      <:row_decorator :let={row}>
        <%= if rem(row.id, 2) == 0 do %>
          <%= TableData.ai_label_markup() %>
        <% end %>
      </:row_decorator>

      <:col :for={col <- @columns} :let={row} label={col.label}>
        <%= Map.get(row, col.key) %>
      </:col>

      <:action :let={_row}>
        <cds-overflow-menu toolbar-action>
          <%= TableData.overflow_menu_icon() %>
          <span slot="tooltip-content">Options</span>
          <cds-overflow-menu-body flipped>
            <cds-overflow-menu-item>Stop app</cds-overflow-menu-item>
            <cds-overflow-menu-item>Restart app</cds-overflow-menu-item>
            <cds-overflow-menu-item>Rename</cds-overflow-menu-item>
          </cds-overflow-menu-body>
        </cds-overflow-menu>
      </:action>

      <:expanded_row :let={row}>
        <h6>Expandable row content</h6>
        <div><%= TableData.expanded_content(row) %></div>
      </:expanded_row>
    </.table>

    <h4>Event log</h4>
    <pre id="advanced-events-log">
      <%= for log <- Enum.reverse(@logs) do %>
        [<%= log.type %>] <%= inspect(log.payload) %>
      <% end %>
    </pre>

    <h4>Callback controls</h4>
    <p>These buttons dispatch the same events as the built-in controls.</p>
    <div id="advanced-events-simulator">
      <%= for {label, detail} <- simulator_events() do %>
        <.button
          kind="tertiary"
          phx-click={
            JS.dispatch(
              "graphene:table-simulate",
              detail: detail,
              to: "#advanced-events-table"
            )
          }
        >
          <%= label %>
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

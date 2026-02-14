defmodule Storybook.BasicComponents.Table do
  use PhoenixStorybook.Story, :example
  import Graphene.BasicComponents
  alias Graphene.CoreComponents
  alias Phoenix.LiveView.JS

  def doc do
    "Basic and advanced table patterns using Graphene.BasicComponents and Graphene.CoreComponents."
  end

  defstruct [:id, :name, :role, :status]

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       rows: [
         %__MODULE__{id: 1, name: "Ada Lovelace", role: "Admin", status: "Active"},
         %__MODULE__{id: 2, name: "Grace Hopper", role: "User", status: "Invited"},
         %__MODULE__{id: 3, name: "Margaret Hamilton", role: "Editor", status: "Active"}
       ],
       logs: []
     )}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <section>
      <h3>BasicComponents table</h3>
      <p>Selection, sorting, and action slots mirror Phoenix core components while using Carbon.</p>
      <.table
        id="basic-table"
        rows={@rows}
        row_id={& &1.id}
        selectable={true}
        sortable={true}
        selected_ids={[1, 2]}
      >
        <:col :let={row} label="id">{row.id}</:col>
        <:col :let={row} label="name">{row.name}</:col>
        <:col :let={row} label="role">{row.role}</:col>
        <:action :let={row}>
          <.button kind="ghost">Edit {row.id}</.button>
        </:action>
      </.table>
    </section>

    <div style="height: 2rem;"></div>

    <section>
      <h3>CoreComponents table</h3>
      <p>
        Carbon extras: zebra styling, sortable headers, toolbar search, and batch actions.
      </p>
      <CoreComponents.table is_selectable={true} is_sortable={true} use_zebra_styles={true}>
        <:s-title>Users</:s-title>
        <:s-description>Selectable rows, toolbar search, and batch actions.</:s-description>
        <:s-toolbar>
          <CoreComponents.table_toolbar>
            <CoreComponents.table_batch_actions active selected_rows_count="2" total_rows_count="3">
              <CoreComponents.button kind="danger--ghost">Delete</CoreComponents.button>
              <CoreComponents.button kind="ghost">Export</CoreComponents.button>
            </CoreComponents.table_batch_actions>
            <CoreComponents.table_toolbar_content has_batch_actions={true}>
              <CoreComponents.table_toolbar_search placeholder="Search users" />
              <CoreComponents.button kind="primary">Add user</CoreComponents.button>
            </CoreComponents.table_toolbar_content>
          </CoreComponents.table_toolbar>
        </:s-toolbar>
        <CoreComponents.table_head>
          <CoreComponents.table_header_row
            selection_name="user-select-all"
            selection_label="Select all"
          >
            <CoreComponents.table_header_cell is_sortable={true}>
              Name
            </CoreComponents.table_header_cell>
            <CoreComponents.table_header_cell is_sortable={true}>
              Role
            </CoreComponents.table_header_cell>
            <CoreComponents.table_header_cell>Status</CoreComponents.table_header_cell>
            <CoreComponents.table_header_cell>Actions</CoreComponents.table_header_cell>
          </CoreComponents.table_header_row>
        </CoreComponents.table_head>
        <CoreComponents.table_body>
          <CoreComponents.table_row
            :for={row <- @rows}
            selection_name={"user-#{row.id}"}
            selection_value={to_string(row.id)}
            selection_label={"Select #{row.name}"}
            selected={row.id in [1, 2]}
          >
            <CoreComponents.table_cell>
              <CoreComponents.table_cell_content>{row.name}</CoreComponents.table_cell_content>
            </CoreComponents.table_cell>
            <CoreComponents.table_cell>
              <CoreComponents.table_cell_content>{row.role}</CoreComponents.table_cell_content>
            </CoreComponents.table_cell>
            <CoreComponents.table_cell>
              <CoreComponents.table_cell_content>{row.status}</CoreComponents.table_cell_content>
            </CoreComponents.table_cell>
            <CoreComponents.table_cell>
              <CoreComponents.table_cell_content>
                <CoreComponents.button kind="ghost">Details</CoreComponents.button>
              </CoreComponents.table_cell_content>
            </CoreComponents.table_cell>
          </CoreComponents.table_row>
        </CoreComponents.table_body>
      </CoreComponents.table>
    </section>

    <div style="height: 2rem;"></div>

    <section>
      <h3>Event logging (BasicComponents table)</h3>
      <p>
        Interact with the table (select rows, use the header checkbox, sort columns). Events emitted
        by the Carbon web component are pushed back into LiveView and recorded below.
      </p>

      <.table
        id="events-table"
        rows={@rows}
        row_id={&"row-#{&1.id}"}
        selectable={true}
        sortable={true}
        selected_ids={[1]}
        on_row_selected={event_handler("row_selected")}
        on_row_all_selected={event_handler("row_all_selected")}
        on_sorted={event_handler("sorted")}
        on_filtered={event_handler("filtered")}
        on_search={event_handler("search")}
        on_batch_cancel={event_handler("batch_cancel")}
      >
        <:col :let={row} label="id">{row.id}</:col>
        <:col :let={row} label="name">{row.name}</:col>
        <:col :let={row} label="role">{row.role}</:col>
        <:action :let={row}>
          <.button kind="ghost">Action #{row.id}</.button>
        </:action>
      </.table>

      <div style="margin: 0.5rem 0 1rem 0; display: flex; gap: 0.5rem; flex-wrap: wrap;">
        <%= for {label, event, detail} <- simulator_events() do %>
          <.button
            kind="tertiary"
            phx-click={
              JS.dispatch(
                event,
                detail: detail,
                to: "#events-table"
              )
            }
          >
            {label}
          </.button>
        <% end %>
      </div>

      <h4>Event log</h4>
      <pre id="basic-events-log" style="max-height: 200px; overflow: auto;">
        <%= for log <- Enum.reverse(@logs) do %>
          <%= "[#{log.type}] " <> inspect(log.payload) %>
          <%= "\n" %>
        <% end %>
      </pre>
    </section>

    <div style="height: 2rem;"></div>

    <section>
      <h3>CoreComponents table (events)</h3>
      <p>
        Native Carbon table wired with the same event hook and logging. Simulator buttons dispatch
        Carbon events to the table so you can verify wiring without shadow DOM clicks.
      </p>
      <.live_component module={Storybook.BasicComponents.Table.CoreEventsComponent} id="core-events" rows={@rows} />
    </section>
    """
  end

  defp event_handler(type) do
    fn payload, socket ->
      {:noreply, log_event(socket, type, payload)}
    end
  end

  defp log_event(socket, type, payload) do
    update(socket, :logs, fn logs ->
      [%{type: type, payload: payload} | Enum.take(logs, 19)]
    end)
  end

  defp simulator_events do
    [
      {"Select row 2", "cds-table-row-selected",
       %{selectedRow: %{dataset: %{rowId: "row-2"}}, selectedRows: [%{dataset: %{rowId: "row-2"}}]}},
      {"Select all", "cds-table-row-all-selected",
       %{selectedRows: (for id <- 1..3, do: %{dataset: %{rowId: "row-#{id}"}})}},
      {"Sort by first column", "cds-table-sorted", %{sortedHeader: %{dataset: %{colIndex: "0"}}}},
      {"Filter (simulated)", "cds-table-filtered",
       %{unfilteredRows: (for id <- 1..3, do: %{dataset: %{rowId: "row-#{id}"}})}},
      {"Search 'Ada'", "cds-search-input", %{searchValue: "Ada"}},
      {"Batch cancel", "cds-table-batch-actions-cancel-clicked", %{}}
    ]
  end
end

defmodule Storybook.BasicComponents.Table.CoreEventsComponent do
  use Phoenix.LiveComponent
  alias Graphene.CoreComponents
  alias Phoenix.LiveView.JS

  @events ~w(graphene:table-row-selected graphene:table-row-all-selected graphene:table-sorted graphene:table-filtered graphene:table-search-input graphene:table-batch-cancel)

  @impl true
  def update(assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:logs, fn -> [] end)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <CoreComponents.table
        id="core-events-table"
        is_selectable={true}
        is_sortable={true}
        use_zebra_styles={true}
        phx-hook="BasicComponentsTable"
        phx-target={@myself}
        size="lg"
      >
        <CoreComponents.table_head>
          <CoreComponents.table_header_row selection_name="core-select-all" selection_label="Select all">
            <CoreComponents.table_header_cell is_sortable={true}>Name</CoreComponents.table_header_cell>
            <CoreComponents.table_header_cell is_sortable={true}>Role</CoreComponents.table_header_cell>
            <CoreComponents.table_header_cell>Status</CoreComponents.table_header_cell>
          </CoreComponents.table_header_row>
        </CoreComponents.table_head>
        <CoreComponents.table_body>
          <CoreComponents.table_row
            :for={row <- @rows}
            id={"core-row-#{row.id}"}
            selection_name={"core-#{row.id}"}
            selection_value={to_string(row.id)}
            selection_label={"Select #{row.name}"}
            selected={row.id in [1]}
          >
            <CoreComponents.table_cell>
              <CoreComponents.table_cell_content>{row.name}</CoreComponents.table_cell_content>
            </CoreComponents.table_cell>
            <CoreComponents.table_cell>
              <CoreComponents.table_cell_content>{row.role}</CoreComponents.table_cell_content>
            </CoreComponents.table_cell>
            <CoreComponents.table_cell>
              <CoreComponents.table_cell_content>{row.status}</CoreComponents.table_cell_content>
            </CoreComponents.table_cell>
          </CoreComponents.table_row>
        </CoreComponents.table_body>
      </CoreComponents.table>

      <div style="margin: 0.5rem 0 1rem 0; display: flex; gap: 0.5rem; flex-wrap: wrap;">
        <%= for {label, event, detail} <- simulator_events() do %>
          <Graphene.BasicComponents.button
            kind="tertiary"
            phx-click={
              JS.dispatch(
                event,
                detail: detail,
                to: "#core-events-table"
              )
            }
          >
            {label}
          </Graphene.BasicComponents.button>
        <% end %>
      </div>

      <h4>Event log</h4>
      <pre id="core-events-log" style="max-height: 200px; overflow: auto;">
        <%= for log <- Enum.reverse(@logs) do %>
          <%= "[#{log.type}] " <> inspect(log.payload) %>
          <%= "\n" %>
        <% end %>
      </pre>
    </div>
    """
  end

  @impl true
  def handle_event(event, payload, socket) when event in @events do
    {:noreply, log_event(socket, event, payload)}
  end

  defp log_event(socket, type, payload) do
    update(socket, :logs, fn logs ->
      [%{type: type, payload: payload} | Enum.take(logs, 19)]
    end)
  end

  defp simulator_events do
    [
      {"Core: Select row 2", "cds-table-row-selected",
       %{selectedRow: %{dataset: %{rowId: "core-row-2"}}, selectedRows: [%{dataset: %{rowId: "core-row-2"}}]}},
      {"Core: Select all", "cds-table-row-all-selected",
       %{selectedRows: (for id <- 1..3, do: %{dataset: %{rowId: "core-row-#{id}"}})}},
      {"Core: Sort by first column", "cds-table-sorted", %{sortedHeader: %{dataset: %{colIndex: "0"}}}},
      {"Core: Filter (simulated)", "cds-table-filtered",
       %{unfilteredRows: (for id <- 1..3, do: %{dataset: %{rowId: "core-row-#{id}"}})}},
      {"Core: Search 'Ada'", "cds-search-input", %{searchValue: "Ada"}},
      {"Core: Batch cancel", "cds-table-batch-actions-cancel-clicked", %{}}
    ]
  end
end

defmodule Storybook.BasicComponents.Table do
  use PhoenixStorybook.Story, :example
  import Graphene.BasicComponents
  alias Graphene.CoreComponents

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
       ]
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
    """
  end
end

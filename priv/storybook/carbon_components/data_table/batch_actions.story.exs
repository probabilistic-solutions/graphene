Code.require_file(Path.join(__DIR__, "shared.exs"))
defmodule Storybook.CarbonComponents.DataTable.BatchActions do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.data_table/1

  def variations do
    [
      %Variation{
        id: :batch_actions,
        attributes: %{
          id: "carbon-batch-actions-table",
          rows: Storybook.CarbonComponents.DataTable.Shared.rows(),
          row_id: &Storybook.CarbonComponents.DataTable.Shared.row_id/1,
          selectable: true,
          selection_name: "carbon-batch-actions"
        },
        slots: [
          ~S|<:title>DataTable</:title>
<:description>With batch actions</:description>
<:toolbar>
  <Graphene.CarbonComponents.table_toolbar>
    <Graphene.CarbonComponents.table_batch_actions total_rows_count="6">
      <Graphene.CarbonComponents.button kind="ghost">Delete</Graphene.CarbonComponents.button>
      <Graphene.CarbonComponents.button kind="ghost">Save</Graphene.CarbonComponents.button>
      <Graphene.CarbonComponents.button kind="ghost" href="#">Download</Graphene.CarbonComponents.button>
    </Graphene.CarbonComponents.table_batch_actions>
    <Graphene.CarbonComponents.table_toolbar_content has_batch_actions>
      <Graphene.CarbonComponents.table_toolbar_search placeholder="Filter table" />
      <Graphene.CarbonComponents.overflow_menu toolbar_action>
        <:icon>
          <Storybook.CarbonComponents.DataTable.Shared.overflow_icon />
        </:icon>
        <:tooltip_content>Settings</:tooltip_content>
        <:item>Action 1</:item>
        <:item>Action 2</:item>
        <:item>Action 3</:item>
      </Graphene.CarbonComponents.overflow_menu>
      <Graphene.CarbonComponents.button>Add new</Graphene.CarbonComponents.button>
    </Graphene.CarbonComponents.table_toolbar_content>
  </Graphene.CarbonComponents.table_toolbar>
</:toolbar>
<:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
  <%= Map.get(row, col.key) %>
</:col>|
        ]
      },
      %Variation{
        id: :compact,
        attributes: %{
          id: "carbon-batch-actions-table-compact",
          rows: Storybook.CarbonComponents.DataTable.Shared.rows(),
          row_id: &Storybook.CarbonComponents.DataTable.Shared.row_id/1,
          selectable: true,
          selection_name: "carbon-batch-actions",
          size: "sm"
        },
        slots: [
          ~S|<:title>DataTable</:title>
<:description>Compact batch actions</:description>
<:toolbar>
  <Graphene.CarbonComponents.table_toolbar>
    <Graphene.CarbonComponents.table_batch_actions total_rows_count="6">
      <Graphene.CarbonComponents.button kind="ghost">Delete</Graphene.CarbonComponents.button>
      <Graphene.CarbonComponents.button kind="ghost">Save</Graphene.CarbonComponents.button>
    </Graphene.CarbonComponents.table_batch_actions>
    <Graphene.CarbonComponents.table_toolbar_content has_batch_actions>
      <Graphene.CarbonComponents.table_toolbar_search placeholder="Filter table" />
      <Graphene.CarbonComponents.overflow_menu toolbar_action>
        <:icon>
          <Storybook.CarbonComponents.DataTable.Shared.overflow_icon />
        </:icon>
        <:tooltip_content>Settings</:tooltip_content>
        <:item>Action 1</:item>
        <:item>Action 2</:item>
      </Graphene.CarbonComponents.overflow_menu>
    </Graphene.CarbonComponents.table_toolbar_content>
  </Graphene.CarbonComponents.table_toolbar>
</:toolbar>
<:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
  <%= Map.get(row, col.key) %>
</:col>|
        ]
      }
    ]
  end
end

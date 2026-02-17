Code.require_file(Path.join(__DIR__, "shared.exs"))
defmodule Storybook.CarbonComponents.DataTable.ToolbarPersistentSmall do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.data_table/1

  def variations do
    [
      %Variation{
        id: :small,
        attributes: %{
          id: "carbon-persistent-toolbar-small-table",
          rows: Storybook.CarbonComponents.DataTable.Shared.rows(),
          row_id: &Graphene.CarbonComponents.DataTable.Shared.row_id/1,
          size: "sm"
        },
        slots: [
          ~S|<:title>DataTable</:title>
<:description>Small persistent toolbar</:description>
<:toolbar>
  <Graphene.CarbonComponents.table_toolbar>
    <Graphene.CarbonComponents.table_toolbar_content>
      <Graphene.CarbonComponents.table_toolbar_search persistent placeholder="Filter table" />
      <Graphene.CarbonComponents.overflow_menu toolbar_action>
        <:icon>
          <Storybook.CarbonComponents.DataTable.Shared.overflow_icon />
        </:icon>
        <:tooltip_content>Settings</:tooltip_content>
        <:item>Action 1</:item>
        <:item>Action 2</:item>
        <:item>Action 3</:item>
      </Graphene.CarbonComponents.overflow_menu>
      <Graphene.CarbonComponents.button>Primary button</Graphene.CarbonComponents.button>
    </Graphene.CarbonComponents.table_toolbar_content>
  </Graphene.CarbonComponents.table_toolbar>
</:toolbar>
<:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
  <%= Map.get(row, col.key) %>
</:col>|
        ]
      },
      %Variation{
        id: :extra_small,
        attributes: %{
          id: "carbon-persistent-toolbar-xs-table",
          rows: Storybook.CarbonComponents.DataTable.Shared.rows(),
          row_id: &Graphene.CarbonComponents.DataTable.Shared.row_id/1,
          size: "xs"
        },
        slots: [
          ~S|<:title>DataTable</:title>
<:description>Extra small</:description>
<:toolbar>
  <Graphene.CarbonComponents.table_toolbar>
    <Graphene.CarbonComponents.table_toolbar_content>
      <Graphene.CarbonComponents.table_toolbar_search persistent placeholder="Filter table" />
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

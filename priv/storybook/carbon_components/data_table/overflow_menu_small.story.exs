Code.require_file(Path.join(__DIR__, "shared.exs"))
defmodule Storybook.CarbonComponents.DataTable.OverflowMenuSmall do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.data_table/1

  def doc do
    Storybook.Doc.markdown("""
Small overflow menus keep table actions available in tight spaces. Use them in
dense toolbars or compact tables where full-width actions do not fit.

Combine .overflow_menu with primary actions in .table_toolbar and keep the menu
items focused on secondary actions.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :small,
        attributes: %{
          id: "carbon-overflow-menu-small-table",
          rows: Storybook.CarbonComponents.DataTable.Shared.rows(),
          row_id: &Graphene.CarbonComponents.DataTable.Shared.row_id/1,
          size: "sm",
          overflow_menu_on_hover: true
        },
        slots: [
          ~S|<:title>DataTable</:title>
<:description>Small overflow menu</:description>
<:toolbar>
  <Graphene.CarbonComponents.table_toolbar>
    <Graphene.CarbonComponents.table_toolbar_content>
      <Graphene.CarbonComponents.table_toolbar_search placeholder="Filter table" />
      <Graphene.CarbonComponents.button>Primary button</Graphene.CarbonComponents.button>
    </Graphene.CarbonComponents.table_toolbar_content>
  </Graphene.CarbonComponents.table_toolbar>
</:toolbar>
<:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
  <%= Map.get(row, col.key) %>
</:col>
<:action :let={_row}>
  <Graphene.CarbonComponents.overflow_menu toolbar_action flipped>
    <:icon>
      <Storybook.CarbonComponents.DataTable.Shared.overflow_icon />
    </:icon>
    <:tooltip_content>Options</:tooltip_content>
    <:item>Stop app</:item>
    <:item>Restart app</:item>
    <:item>Rename</:item>
  </Graphene.CarbonComponents.overflow_menu>
</:action>|
        ]
      },
      %Variation{
        id: :extra_small,
        attributes: %{
          id: "carbon-overflow-menu-xs-table",
          rows: Storybook.CarbonComponents.DataTable.Shared.rows(),
          row_id: &Graphene.CarbonComponents.DataTable.Shared.row_id/1,
          size: "xs",
          overflow_menu_on_hover: true
        },
        slots: [
          ~S|<:title>DataTable</:title>
<:description>Extra small overflow</:description>
<:toolbar>
  <Graphene.CarbonComponents.table_toolbar>
    <Graphene.CarbonComponents.table_toolbar_content>
      <Graphene.CarbonComponents.table_toolbar_search placeholder="Filter table" />
    </Graphene.CarbonComponents.table_toolbar_content>
  </Graphene.CarbonComponents.table_toolbar>
</:toolbar>
<:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
  <%= Map.get(row, col.key) %>
</:col>
<:action :let={_row}>
  <Graphene.CarbonComponents.overflow_menu toolbar_action flipped>
    <:icon>
      <Storybook.CarbonComponents.DataTable.Shared.overflow_icon />
    </:icon>
    <:tooltip_content>Options</:tooltip_content>
    <:item>Stop app</:item>
    <:item>Restart app</:item>
  </Graphene.CarbonComponents.overflow_menu>
</:action>|
        ]
      }
    ]
  end
end

Code.require_file(Path.join(__DIR__, "shared.exs"))
defmodule Storybook.CarbonComponents.DataTable.Expansion do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.data_table/1

  def doc do
    Storybook.Doc.markdown("""
Expandable rows let users drill into details inline. Use them when secondary
information is helpful but not required for every row.

Combine expansion content with .structured_list, .tag, or .link elements so the
details stay concise and actionable.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :expandable,
        attributes: %{
          id: "carbon-expansion-table",
          rows: Storybook.CarbonComponents.DataTable.Shared.rows(),
          row_id: &Graphene.CarbonComponents.DataTable.Shared.row_id/1,
          expandable: true
        },
        slots: [
          ~S|<:title>DataTable</:title>
<:description>Expandable rows</:description>
<:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
  <%= Map.get(row, col.key) %>
</:col>
<:expanded_row :let={row}>
  <h6>Expandable row content</h6>
  <div><%= Storybook.CarbonComponents.DataTable.Shared.expanded_content(row) %></div>
</:expanded_row>|
        ]
      },
      %Variation{
        id: :compact,
        attributes: %{
          id: "carbon-expansion-table-compact",
          rows: Storybook.CarbonComponents.DataTable.Shared.rows(),
          row_id: &Graphene.CarbonComponents.DataTable.Shared.row_id/1,
          expandable: true,
          size: "sm",
          use_zebra_styles: false
        },
        slots: [
          ~S|<:title>DataTable</:title>
<:description>Compact expandable</:description>
<:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
  <%= Map.get(row, col.key) %>
</:col>
<:expanded_row :let={row}>
  <h6>Details</h6>
  <div><%= Storybook.CarbonComponents.DataTable.Shared.expanded_content(row) %></div>
</:expanded_row>|
        ]
      }
    ]
  end
end

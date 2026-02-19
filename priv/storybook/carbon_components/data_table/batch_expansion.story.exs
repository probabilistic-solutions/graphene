Code.require_file(Path.join(__DIR__, "shared.exs"))
defmodule Storybook.CarbonComponents.DataTable.BatchExpansion do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.data_table/1

  def doc do
    Storybook.Doc.markdown("""
Batch expansion reveals details for multiple rows at once. Use it when users
need to review or compare row-level detail in bulk.

Pair with clear expansion content, such as a .structured_list, and keep row
actions in the toolbar for consistency.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :batch_expansion,
        attributes: %{
          id: "carbon-batch-expansion-table",
          rows: Storybook.CarbonComponents.DataTable.Shared.rows(),
          row_id: &Graphene.CarbonComponents.DataTable.Shared.row_id/1,
          expandable: true,
          batch_expansion: true
        },
        slots: [
          ~S|<:title>DataTable</:title>
<:description>Batch expansion</:description>
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
        id: :expandable_only,
        attributes: %{
          id: "carbon-batch-expansion-table-simple",
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
  <h6>Details</h6>
  <div><%= Storybook.CarbonComponents.DataTable.Shared.expanded_content(row) %></div>
</:expanded_row>|
        ]
      }
    ]
  end
end

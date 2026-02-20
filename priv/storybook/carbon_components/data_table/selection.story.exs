Code.require_file(Path.join(__DIR__, "shared.exs"))
defmodule Storybook.CarbonComponents.DataTable.Selection do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.data_table/1

  def doc do
    Storybook.Doc.markdown("""
Row selection enables multi-row actions and comparison. Use checkbox selection
when multiple rows can be chosen at once.

Pair selection with .table_batch_actions and provide clear selected counts in
the toolbar.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :checkboxes,
        attributes: %{
          id: "carbon-selection-table",
          rows: Storybook.CarbonComponents.DataTable.Shared.rows(),
          row_id: &Graphene.CarbonComponents.DataTable.Shared.row_id/1,
          selectable: true,
          selection_name: "carbon-selection"
        },
        slots: [
          ~S|<:title>DataTable</:title>
<:description>Row selection</:description>
<:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
  <%= Map.get(row, col.key) %>
</:col>|
        ]
      },
      %Variation{
        id: :preselected,
        attributes: %{
          id: "carbon-selection-table-selected",
          rows: Storybook.CarbonComponents.DataTable.Shared.rows(),
          row_id: &Graphene.CarbonComponents.DataTable.Shared.row_id/1,
          selectable: true,
          selection_name: "carbon-selection",
          selected_ids: [Graphene.CarbonComponents.DataTable.Shared.row_id(Enum.at(Storybook.CarbonComponents.DataTable.Shared.rows(), 1))]
        },
        slots: [
          ~S|<:title>DataTable</:title>
<:description>Preselected row</:description>
<:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
  <%= Map.get(row, col.key) %>
</:col>|
        ]
      }
    ]
  end
end

Code.require_file(Path.join(__DIR__, "shared.exs"))
defmodule Storybook.CarbonComponents.DataTable.SelectionRadio do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.data_table/1

  def doc do
    Storybook.Doc.markdown("""
Radio selection supports single-row selection in a table. Use it when only one
row should be active at a time.

Combine with detail panels or forms that reflect the single selected row.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :radio,
        attributes: %{
          id: "carbon-radio-selection-table",
          rows: Storybook.CarbonComponents.DataTable.Shared.rows(),
          row_id: &Graphene.CarbonComponents.DataTable.Shared.row_id/1,
          selectable: true,
          radio: true,
          selection_name: "carbon-radio-selection"
        },
        slots: [
          ~S|<:title>DataTable</:title>
<:description>Radio selection</:description>
<:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
  <%= Map.get(row, col.key) %>
</:col>|
        ]
      },
      %Variation{
        id: :radio_selected,
        attributes: %{
          id: "carbon-radio-selection-table-selected",
          rows: Storybook.CarbonComponents.DataTable.Shared.rows(),
          row_id: &Graphene.CarbonComponents.DataTable.Shared.row_id/1,
          selectable: true,
          radio: true,
          selection_name: "carbon-radio-selection",
          selected_ids: [Graphene.CarbonComponents.DataTable.Shared.row_id(Enum.at(Storybook.CarbonComponents.DataTable.Shared.rows(), 2))]
        },
        slots: [
          ~S|<:title>DataTable</:title>
<:description>Preselected radio</:description>
<:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
  <%= Map.get(row, col.key) %>
</:col>|
        ]
      }
    ]
  end
end

Code.require_file(Path.join(__DIR__, "shared.exs"))
defmodule Storybook.CarbonComponents.DataTable.SelectionRadioSorting do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.data_table/1

  def doc do
    Storybook.Doc.markdown("""
Single-row selection with sorting helps users pick the best match from a
sortable dataset. Use this when users compare rows before choosing one.

Pair with column sorting and concise detail views for the selected row.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :radio_sorting,
        attributes: %{
          id: "carbon-radio-sorting-table",
          rows: Storybook.CarbonComponents.DataTable.Shared.rows(),
          row_id: &Graphene.CarbonComponents.DataTable.Shared.row_id/1,
          selectable: true,
          radio: true,
          sortable: true,
          selection_name: "carbon-radio-sorting"
        },
        slots: [
          ~S|<:title>DataTable</:title>
<:description>Radio selection and sorting</:description>
<:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
  <%= Map.get(row, col.key) %>
</:col>|
        ]
      },
      %Variation{
        id: :compact,
        attributes: %{
          id: "carbon-radio-sorting-table-compact",
          rows: Storybook.CarbonComponents.DataTable.Shared.rows(),
          row_id: &Graphene.CarbonComponents.DataTable.Shared.row_id/1,
          selectable: true,
          radio: true,
          sortable: true,
          size: "sm",
          selection_name: "carbon-radio-sorting"
        },
        slots: [
          ~S|<:title>DataTable</:title>
<:description>Compact sorting</:description>
<:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
  <%= Map.get(row, col.key) %>
</:col>|
        ]
      }
    ]
  end
end

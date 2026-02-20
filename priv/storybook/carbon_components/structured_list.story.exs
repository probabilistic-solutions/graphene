defmodule Storybook.CarbonComponents.StructuredList do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.structured_list/1

  def doc do
    Storybook.Doc.markdown("""
Structured lists present key-value or comparison content in aligned columns.
Use them for summaries, definitions, or selectable lists.

Pair .structured_list with .checkbox or .radio_button when selection is needed,
and keep rows concise.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{rows: rows()},
        slots: [
          ~S|<:col :let={row} label="Name"><%= row.name %></:col>
<:col :let={row} label="Status"><%= row.status %></:col>|
        ]
      },
      %Variation{
        id: :condensed,
        attributes: %{rows: rows(), condensed: true},
        slots: [
          ~S|<:col :let={row} label="Service"><%= row.name %></:col>
<:col :let={row} label="State"><%= row.status %></:col>|
        ]
      },
      %Variation{
        id: :selectable,
        attributes: %{
          rows: rows(),
          selection_name: "structured-list",
          selected_ids: ["1"],
          row_id: &row_id/1
        },
        slots: [
          ~S|<:col :let={row} label="Name"><%= row.name %></:col>
<:col :let={row} label="Status"><%= row.status %></:col>|
        ]
      }
    ]
  end

  defp rows do
    [
      %{id: "1", name: "Load Balancer 1", status: "Active"},
      %{id: "2", name: "Load Balancer 2", status: "Disabled"},
      %{id: "3", name: "Gateway", status: "Active"}
    ]
  end

  defp row_id(row), do: row.id
end

Code.require_file(Path.join(__DIR__, "shared.exs"))
defmodule Storybook.CarbonComponents.DataTable.Sorting do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.data_table/1

  def variations do
    [
      %Variation{
        id: :sorting,
        attributes: %{id: "carbon-sorting-table", rows: Storybook.CarbonComponents.DataTable.Shared.rows(), row_id: &Storybook.CarbonComponents.DataTable.Shared.row_id/1, sortable: true},
        slots: [
          ~S|<:title>DataTable</:title>
<:description>Sorting enabled</:description>
<:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
  <%= Map.get(row, col.key) %>
</:col>|
        ]
      },
      %Variation{
        id: :compact,
        attributes: %{id: "carbon-sorting-table-compact", rows: Storybook.CarbonComponents.DataTable.Shared.rows(), row_id: &Storybook.CarbonComponents.DataTable.Shared.row_id/1, sortable: true, size: "sm"},
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

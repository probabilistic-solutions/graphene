Code.require_file(Path.join(__DIR__, "shared.exs"))
defmodule Storybook.CarbonComponents.DataTable.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.data_table/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{id: "carbon-basic-table", rows: Storybook.CarbonComponents.DataTable.Shared.rows(), row_id: &Storybook.CarbonComponents.DataTable.Shared.row_id/1},
        slots: [
          ~S|<:title>DataTable</:title>
<:description>Basic</:description>
<:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
  <%= Map.get(row, col.key) %>
</:col>|
        ]
      },
      %Variation{
        id: :compact,
        attributes: %{
          id: "carbon-basic-table-compact",
          rows: Storybook.CarbonComponents.DataTable.Shared.rows(),
          row_id: &Storybook.CarbonComponents.DataTable.Shared.row_id/1,
          size: "sm",
          use_zebra_styles: false
        },
        slots: [
          ~S|<:title>DataTable</:title>
<:description>Compact</:description>
<:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
  <%= Map.get(row, col.key) %>
</:col>|
        ]
      }
    ]
  end
end

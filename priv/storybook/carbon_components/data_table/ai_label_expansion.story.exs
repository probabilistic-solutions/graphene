Code.require_file(Path.join(__DIR__, "shared.exs"))
defmodule Storybook.CarbonComponents.DataTable.AILabelExpansion do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.data_table/1

  def variations do
    [
      %Variation{
        id: :ai_expand,
        attributes: %{
          id: "carbon-ai-label-expansion-table",
          rows: Storybook.CarbonComponents.DataTable.Shared.rows(),
          row_id: &Graphene.CarbonComponents.DataTable.Shared.row_id/1,
          expandable: true,
          batch_expansion: true,
          with_row_ai_labels: true
        },
        slots: [
          ~S|<:title>DataTable</:title>
<:description>AI labels with expansion</:description>
<:row_decorator :let={row}>
  <%= if rem(row.id, 2) == 0 do %>
    <Storybook.CarbonComponents.DataTable.Shared.ai_label />
  <% end %>
</:row_decorator>
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
          id: "carbon-ai-label-expansion-table-compact",
          rows: Storybook.CarbonComponents.DataTable.Shared.rows(),
          row_id: &Graphene.CarbonComponents.DataTable.Shared.row_id/1,
          expandable: true,
          batch_expansion: true,
          with_row_ai_labels: true,
          size: "sm"
        },
        slots: [
          ~S|<:title>DataTable</:title>
<:description>Compact AI expansion</:description>
<:row_decorator :let={row}>
  <%= if rem(row.id, 2) == 0 do %>
    <Storybook.CarbonComponents.DataTable.Shared.ai_label />
  <% end %>
</:row_decorator>
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

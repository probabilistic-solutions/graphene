Code.require_file(Path.join(__DIR__, "shared.exs"))
defmodule Storybook.CarbonComponents.DataTable.AILabel do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.data_table/1

  def doc do
    Storybook.Doc.markdown("""
Data tables present structured datasets with columns and rows. This story shows
AI labels applied to table content to indicate AI-generated fields.

Combine .data_table with .ai_label in headers or cells and add a .tooltip or
.toggletip to explain AI provenance.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :row_labels,
        attributes: %{
          id: "carbon-ai-label-table",
          rows: Storybook.CarbonComponents.DataTable.Shared.rows(),
          row_id: &Graphene.CarbonComponents.DataTable.Shared.row_id/1,
          selectable: true,
          expandable: true,
          batch_expansion: true,
          with_row_ai_labels: true
        },
        slots: [
          ~S|<:title>DataTable</:title>
<:description>AI labels</:description>
<:row_decorator :let={row}>
  <%= if rem(row.id, 2) == 0 do %>
    <Storybook.CarbonComponents.DataTable.Shared.ai_label />
  <% end %>
</:row_decorator>
<:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
  <%= Map.get(row, col.key) %>
</:col>|
        ]
      },
      %Variation{
        id: :compact,
        attributes: %{
          id: "carbon-ai-label-table-compact",
          rows: Storybook.CarbonComponents.DataTable.Shared.rows(),
          row_id: &Graphene.CarbonComponents.DataTable.Shared.row_id/1,
          selectable: true,
          expandable: true,
          batch_expansion: true,
          with_row_ai_labels: true,
          size: "sm"
        },
        slots: [
          ~S|<:title>DataTable</:title>
<:description>Compact AI labels</:description>
<:row_decorator :let={row}>
  <%= if rem(row.id, 2) == 0 do %>
    <Storybook.CarbonComponents.DataTable.Shared.ai_label />
  <% end %>
</:row_decorator>
<:col :for={col <- Storybook.CarbonComponents.DataTable.Shared.columns()} :let={row} label={col.label}>
  <%= Map.get(row, col.key) %>
</:col>|
        ]
      }
    ]
  end
end

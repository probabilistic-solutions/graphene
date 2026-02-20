Code.require_file(Path.join(__DIR__, "shared.exs"))
defmodule Storybook.CarbonComponents.DataTable.AILabelSort do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.data_table/1

  def doc do
    Storybook.Doc.markdown("""
Sortable data tables help users compare datasets by column. This story adds AI
labels to sortable headers to flag AI-enhanced fields.

Combine sortable headers with .tooltip for AI explanations and keep sorting
consistent across related columns.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :sorting,
        attributes: %{id: "carbon-ai-label-sort-table", rows: Storybook.CarbonComponents.DataTable.Shared.rows(), row_id: &Graphene.CarbonComponents.DataTable.Shared.row_id/1, sortable: true},
        slots: [
          ~S|<:title>DataTable</:title>
<:description>AI label in header with sorting</:description>
<:col label="Name" :let={row}><%= row.name %></:col>
<:col label="Protocol" :let={row}><%= row.protocol %></:col>
<:col label="Port" :let={row}><%= row.port %></:col>
<:col label="Rule" :let={row}><%= row.rule %></:col>
<:col label={fn -> Storybook.CarbonComponents.DataTable.Shared.ai_label_header(%{}) end} :let={row}><%= row.group %></:col>
<:col label="Status" :let={row}><%= row.status %></:col>|
        ]
      },
      %Variation{
        id: :compact,
        attributes: %{id: "carbon-ai-label-sort-table-compact", rows: Storybook.CarbonComponents.DataTable.Shared.rows(), row_id: &Graphene.CarbonComponents.DataTable.Shared.row_id/1, sortable: true, size: "sm"},
        slots: [
          ~S|<:title>DataTable</:title>
<:description>Compact AI label header</:description>
<:col label="Name" :let={row}><%= row.name %></:col>
<:col label="Protocol" :let={row}><%= row.protocol %></:col>
<:col label="Port" :let={row}><%= row.port %></:col>
<:col label="Rule" :let={row}><%= row.rule %></:col>
<:col label={fn -> Storybook.CarbonComponents.DataTable.Shared.ai_label_header(%{}) end} :let={row}><%= row.group %></:col>
<:col label="Status" :let={row}><%= row.status %></:col>|
        ]
      }
    ]
  end
end

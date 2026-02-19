Code.require_file(Path.join(__DIR__, "shared.exs"))
defmodule Storybook.CarbonComponents.DataTable.Skeleton do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.table_skeleton/1

  def doc do
    Storybook.Doc.markdown("""
Table skeletons preserve layout while data loads. Use them for initial load or
refresh states to prevent layout jumps.

Swap .table_skeleton for the real .data_table once data is ready, and avoid
long spinner-only waits.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{column_count: "6", row_count: "5", show_header: true, show_toolbar: true}
      },
      %Variation{
        id: :compact,
        attributes: %{column_count: "4", row_count: "3", show_header: true, show_toolbar: false}
      },
      %Variation{
        id: :large,
        attributes: %{column_count: "8", row_count: "8", show_header: true, show_toolbar: true}
      }
    ]
  end
end

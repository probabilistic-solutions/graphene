Code.require_file(Path.join(__DIR__, "shared.exs"))
defmodule Storybook.CarbonComponents.DataTable.Skeleton do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.table_skeleton/1

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

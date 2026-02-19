defmodule Storybook.CarbonComponents.ProgressBar do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.progress_bar/1

  def doc do
    Storybook.Doc.markdown("""
Progress bars show the completion of a long-running process. Use them when the
duration is measurable or can be approximated.

Pair .progress_bar with status text or .inline_loading and avoid indeterminate
bars for short tasks.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :quarter,
        attributes: %{value: "25", max: "100"}
      },
      %Variation{
        id: :half,
        attributes: %{value: "50", max: "100"}
      },
      %Variation{
        id: :complete,
        attributes: %{value: "100", max: "100"}
      }
    ]
  end
end

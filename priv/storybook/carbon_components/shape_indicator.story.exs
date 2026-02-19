defmodule Storybook.CarbonComponents.ShapeIndicator do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.shape_indicator/1

  def doc do
    Storybook.Doc.markdown("""
Shape indicators convey status using simple shapes and labels. Use them in dense
interfaces where a compact status marker is needed.

Pair .shape_indicator with .tag or .icon_indicator to reinforce meaning.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :success,
        attributes: %{kind: "success", label: "Success"}
      },
      %Variation{
        id: :failed,
        attributes: %{kind: "failed", label: "Failed"}
      },
      %Variation{
        id: :warning,
        attributes: %{kind: "warning", label: "Warning"}
      }
    ]
  end
end

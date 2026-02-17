defmodule Storybook.CarbonComponents.AISkeleton.Text do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.ai_skeleton_text/1

  def variations do
    [
      %Variation{
        id: :single,
        attributes: %{width: "60%"}
      },
      %Variation{
        id: :paragraph,
        attributes: %{paragraph: true, line_count: "4"}
      },
      %Variation{
        id: :heading,
        attributes: %{heading: true, width: "40%"}
      }
    ]
  end
end

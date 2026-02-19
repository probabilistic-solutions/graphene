defmodule Storybook.CarbonComponents.AISkeleton.Placeholder do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.ai_skeleton_placeholder/1

  def doc do
    Storybook.Doc.markdown("""
AI skeleton placeholders reserve space for AI-generated panels or cards while
content loads. Use them to stabilize layout during longer generation steps.

Pair with .tile or .contained_list so the skeleton matches the final layout, and
swap in .ai_label when content is ready.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :small,
        attributes: %{style: "width: 120px; height: 16px;"}
      },
      %Variation{
        id: :medium,
        attributes: %{style: "width: 200px; height: 24px;"}
      },
      %Variation{
        id: :large,
        attributes: %{style: "width: 280px; height: 32px;"}
      }
    ]
  end
end

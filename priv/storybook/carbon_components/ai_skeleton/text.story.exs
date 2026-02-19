defmodule Storybook.CarbonComponents.AISkeleton.Text do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.ai_skeleton_text/1

  def doc do
    Storybook.Doc.markdown("""
AI skeleton text indicates that AI-written copy is loading. Use it for response
blocks, summaries, or explanations that take time to generate.

Pair with .skeleton_text for nearby static content and replace with .ai_label
once the AI response is shown.
""")
  end

  

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

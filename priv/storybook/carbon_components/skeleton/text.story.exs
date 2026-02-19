defmodule Storybook.CarbonComponents.Skeleton.Text do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.skeleton_text/1

  def doc do
    Storybook.Doc.markdown("""
Skeleton text indicates that textual content is loading. Use it for lists,
tables, and content blocks with delayed data.

Combine with .skeleton_placeholder to match the overall layout.
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

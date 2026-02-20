defmodule Storybook.CarbonComponents.Skeleton.Placeholder do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.skeleton_placeholder/1

  def doc do
    Storybook.Doc.markdown("""
Skeleton placeholders reserve space for cards or blocks of content. Use them for
dashboards and tiles while data loads.

Pair .skeleton_placeholder with .skeleton_text to mirror the final layout.
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

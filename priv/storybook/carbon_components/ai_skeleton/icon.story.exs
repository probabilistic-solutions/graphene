defmodule Storybook.CarbonComponents.AISkeleton.Icon do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.ai_skeleton_icon/1

  def doc do
    Storybook.Doc.markdown("""
AI skeleton icons are lightweight placeholders while AI-driven iconography or
badges load. Use them when generation time is noticeable to avoid layout shift.

Replace them with the final .icon and include .ai_label nearby to maintain AI
transparency.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :small,
        attributes: %{custom_styles: "width: 16px; height: 16px;"}
      },
      %Variation{
        id: :medium,
        attributes: %{custom_styles: "width: 24px; height: 24px;"}
      },
      %Variation{
        id: :large,
        attributes: %{custom_styles: "width: 32px; height: 32px;"}
      }
    ]
  end
end

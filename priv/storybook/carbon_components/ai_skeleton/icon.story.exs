defmodule Storybook.CarbonComponents.AISkeleton.Icon do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.ai_skeleton_icon/1

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

defmodule Storybook.CarbonComponents.Skeleton.Icon do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.skeleton_icon/1

  def variations do
    [
      %Variation{
        id: :small,
        attributes: %{style: "width: 16px; height: 16px;"}
      },
      %Variation{
        id: :medium,
        attributes: %{style: "width: 24px; height: 24px;"}
      },
      %Variation{
        id: :large,
        attributes: %{style: "width: 32px; height: 32px;"}
      }
    ]
  end
end

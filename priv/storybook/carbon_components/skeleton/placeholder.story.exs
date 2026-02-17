defmodule Storybook.CarbonComponents.Skeleton.Placeholder do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.skeleton_placeholder/1

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

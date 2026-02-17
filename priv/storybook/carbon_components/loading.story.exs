defmodule Storybook.CarbonComponents.Loading do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.loading/1

  def variations do
    [
      %Variation{
        id: :active,
        attributes: %{active: true, description: "Loading"}
      },
      %Variation{
        id: :inactive,
        attributes: %{active: false, description: "Idle"}
      },
      %Variation{
        id: :small,
        attributes: %{active: true, description: "Loading", size: "sm"}
      }
    ]
  end
end

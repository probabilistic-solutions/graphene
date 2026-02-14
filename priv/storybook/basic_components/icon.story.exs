defmodule Storybook.BasicComponents.Icon do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.BasicComponents.icon/1

  def variations do
    [
      %Variation{
        id: :carbon,
        attributes: %{name: "add", size: 20}
      },
      %Variation{
        id: :hero_compat,
        attributes: %{name: "hero-x-mark", size: 20}
      }
    ]
  end
end

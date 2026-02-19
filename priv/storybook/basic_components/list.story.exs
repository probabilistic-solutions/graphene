defmodule Storybook.BasicComponents.List do
  use PhoenixStorybook.Story, :component
  use Graphene, [:html, :live]

  def function, do: &Graphene.BasicComponents.list/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          ~S|<:item title="Title">The first item</:item>|,
          ~S|<:item title="Views">1,234</:item>|
        ]
      }
    ]
  end
end

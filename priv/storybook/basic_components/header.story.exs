defmodule Storybook.BasicComponents.Header do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.BasicComponents.header/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          "Dashboard",
          ~S|<:subtitle>Monthly summary</:subtitle>|,
          ~S|<:actions><Graphene.BasicComponents.button kind="ghost">New</Graphene.BasicComponents.button></:actions>|
        ]
      }
    ]
  end
end

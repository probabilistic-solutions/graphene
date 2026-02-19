defmodule Storybook.BasicComponents.Header do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.BasicComponents.header/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          ~S|<:name href="#" prefix="IBM">Nimbus</:name>|,
          "Dashboard",
          ~S|<:global><Graphene.BasicComponents.button kind="ghost">New</Graphene.BasicComponents.button></:global>|
        ]
      }
    ]
  end
end

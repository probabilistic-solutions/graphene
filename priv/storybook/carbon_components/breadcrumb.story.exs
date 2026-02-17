defmodule Storybook.CarbonComponents.Breadcrumb do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.breadcrumb/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          ~S|<:item href="#">Home</:item>
<:item href="#">Catalog</:item>
<:item current>Current page</:item>|
        ]
      },
      %Variation{
        id: :no_trailing_slash,
        attributes: %{no_trailing_slash: true},
        slots: [
          ~S|<:item href="#">Home</:item>
<:item href="#">Library</:item>
<:item current>Components</:item>|
        ]
      },
      %Variation{
        id: :small,
        attributes: %{size: "sm"},
        slots: [
          ~S|<:item href="#">Home</:item>
<:item href="#">Docs</:item>
<:item current>Breadcrumb</:item>|
        ]
      }
    ]
  end
end

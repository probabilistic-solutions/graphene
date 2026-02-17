defmodule Storybook.CarbonComponents.Tile do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.tile/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: ["Basic tile"]
      },
      %Variation{
        id: :light,
        attributes: %{color_scheme: "light"},
        slots: ["Light tile"]
      },
      %Variation{
        id: :rounded,
        attributes: %{has_rounded_corners: true},
        slots: ["Rounded corners"]
      }
    ]
  end
end

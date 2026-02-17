defmodule Storybook.CarbonComponents.Link do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.link/1

  def variations do
    [
      %Variation{
        id: :inline,
        attributes: %{href: "#"},
        slots: ["Inline link"]
      },
      %Variation{
        id: :external,
        attributes: %{href: "#", target: "_blank", rel: "noreferrer"},
        slots: ["External link"]
      },
      %Variation{
        id: :disabled,
        attributes: %{href: "#", disabled: true},
        slots: ["Disabled link"]
      }
    ]
  end
end

defmodule Storybook.CarbonComponents.Slider.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.slider/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{min: "0", max: "100", value: "50"},
        slots: [~S|<:label_text>Slider</:label_text>|]
      },
      %Variation{
        id: :stepped,
        attributes: %{min: "0", max: "10", step: "1", value: "3"},
        slots: [~S|<:label_text>Step</:label_text>|]
      },
      %Variation{
        id: :disabled,
        attributes: %{min: "0", max: "100", value: "40", disabled: true},
        slots: [~S|<:label_text>Disabled</:label_text>|]
      }
    ]
  end
end

defmodule Storybook.CarbonComponents.Slider.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.slider/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{label_text: "Slider", min: "0", max: "100", value: "50"}
      },
      %Variation{
        id: :stepped,
        attributes: %{label_text: "Step", min: "0", max: "10", step: "1", value: "3"}
      },
      %Variation{
        id: :disabled,
        attributes: %{label_text: "Disabled", min: "0", max: "100", value: "40", disabled: true}
      }
    ]
  end
end

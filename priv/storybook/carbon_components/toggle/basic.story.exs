defmodule Storybook.CarbonComponents.Toggle.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.toggle/1

  def variations do
    [
      %Variation{
        id: :on,
        attributes: %{label_text: "Notifications", label_a: "On", label_b: "Off", toggled: true}
      },
      %Variation{
        id: :off,
        attributes: %{label_text: "Notifications", label_a: "On", label_b: "Off", toggled: false}
      },
      %Variation{
        id: :disabled,
        attributes: %{label_text: "Disabled", label_a: "On", label_b: "Off", disabled: true}
      }
    ]
  end
end

defmodule Storybook.CarbonComponents.Toggle.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.toggle/1

  def variations do
    [
      %Variation{
        id: :on,
        attributes: %{name: "toggle-on", label_a: "On", label_b: "Off", toggled: true},
        slots: [~S|<:label_text>Notifications</:label_text>|]
      },
      %Variation{
        id: :off,
        attributes: %{name: "toggle-off", label_a: "On", label_b: "Off", toggled: false},
        slots: [~S|<:label_text>Notifications</:label_text>|]
      },
      %Variation{
        id: :disabled,
        attributes: %{name: "toggle-disabled", label_a: "On", label_b: "Off", disabled: true},
        slots: [~S|<:label_text>Disabled</:label_text>|]
      }
    ]
  end
end

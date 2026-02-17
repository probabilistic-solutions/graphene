defmodule Storybook.CarbonComponents.TextInput.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.text_input/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{value: "Ada"},
        slots: [
          ~S|<:s-label-text>First name</:s-label-text>|
        ]
      },
      %Variation{
        id: :helper_text,
        attributes: %{value: "Lovelace"},
        slots: [
          ~S|<:s-label-text>Last name</:s-label-text>
<:s-helper-text>As shown on your ID</:s-helper-text>|
        ]
      },
      %Variation{
        id: :invalid,
        attributes: %{value: "", invalid: true, invalid_text: "Required"},
        slots: [
          ~S|<:s-label-text>Username</:s-label-text>|
        ]
      }
    ]
  end
end

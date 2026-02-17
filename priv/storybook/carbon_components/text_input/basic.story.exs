defmodule Storybook.CarbonComponents.TextInput.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.text_input/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{name: "text-input-default", value: "Ada"},
        slots: [
          ~S|<:label_text>First name</:label_text>|
        ]
      },
      %Variation{
        id: :helper_text,
        attributes: %{name: "text-input-helper", value: "Lovelace"},
        slots: [
          ~S|<:label_text>Last name</:label_text>
<:helper_text>As shown on your ID</:helper_text>|
        ]
      },
      %Variation{
        id: :invalid,
        attributes: %{name: "text-input-invalid", value: "", invalid: true, invalid_text: "Required"},
        slots: [
          ~S|<:label_text>Username</:label_text>|
        ]
      }
    ]
  end
end

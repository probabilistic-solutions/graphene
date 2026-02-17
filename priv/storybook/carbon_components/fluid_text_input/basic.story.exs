defmodule Storybook.CarbonComponents.FluidTextInput.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.fluid_text_input/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{name: "fluid-text-input-default", value: ""},
        slots: [
          ~S|<:label_text>First name</:label_text>|
        ]
      },
      %Variation{
        id: :helper_text,
        attributes: %{name: "fluid-text-input-helper", value: "Ada"},
        slots: [
          ~S|<:label_text>Name</:label_text>
<:helper_text>As shown on your ID</:helper_text>|
        ]
      },
      %Variation{
        id: :invalid,
        attributes: %{name: "fluid-text-input-invalid", value: ""},
        slots: [
          ~S|<:label_text>Username</:label_text>
<:validity_message>Required</:validity_message>|
        ]
      }
    ]
  end
end

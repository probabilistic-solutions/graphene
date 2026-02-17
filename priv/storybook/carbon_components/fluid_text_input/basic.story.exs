defmodule Storybook.CarbonComponents.FluidTextInput.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.fluid_text_input/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{value: ""},
        slots: [
          ~S|<:s-label-text>First name</:s-label-text>|
        ]
      },
      %Variation{
        id: :helper_text,
        attributes: %{value: "Ada"},
        slots: [
          ~S|<:s-label-text>Name</:s-label-text>
<:s-helper-text>As shown on your ID</:s-helper-text>|
        ]
      },
      %Variation{
        id: :invalid,
        attributes: %{value: "", validity_message: "Required"},
        slots: [
          ~S|<:s-label-text>Username</:s-label-text>
<:s-validity-message>Required</:s-validity-message>|
        ]
      }
    ]
  end
end

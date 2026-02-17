defmodule Storybook.CarbonComponents.FluidNumberInput.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.fluid_number_input/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{name: "fluid-number-default", value: "10"},
        slots: [
          ~S|<:label_text>Quantity</:label_text>|
        ]
      },
      %Variation{
        id: :helper_text,
        attributes: %{name: "fluid-number-helper", value: "2"},
        slots: [
          ~S|<:label_text>Seats</:label_text>
<:helper_text>Available seats</:helper_text>|
        ]
      },
      %Variation{
        id: :invalid,
        attributes: %{name: "fluid-number-invalid", value: "0"},
        slots: [
          ~S|<:label_text>Licenses</:label_text>
<:validity_message>Minimum is 1</:validity_message>|
        ]
      }
    ]
  end
end

defmodule Storybook.CarbonComponents.NumberInput.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.number_input/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{value: "10"},
        slots: [
          ~S|<:s-label-text>Quantity</:s-label-text>|
        ]
      },
      %Variation{
        id: :helper_text,
        attributes: %{value: "2"},
        slots: [
          ~S|<:s-label-text>Seats</:s-label-text>
<:s-helper-text>Available seats</:s-helper-text>|
        ]
      },
      %Variation{
        id: :invalid,
        attributes: %{value: "0", invalid: true, invalid_text: "Minimum is 1"},
        slots: [
          ~S|<:s-label-text>Licenses</:s-label-text>|
        ]
      }
    ]
  end
end

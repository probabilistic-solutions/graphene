defmodule Storybook.CarbonComponents.FluidSelect.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.fluid_select/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{label_text: "Select an option"},
        slots: [
          ~S|<:item value="">Choose one</:item>
<:item value="option-1">Option 1</:item>
<:item value="option-2">Option 2</:item>
<:item value="option-3">Option 3</:item>|
        ]
      },
      %Variation{
        id: :inline,
        attributes: %{label_text: "Inline", inline: true},
        slots: [
          ~S|<:item value="alpha">Alpha</:item>
<:item value="beta">Beta</:item>|
        ]
      },
      %Variation{
        id: :invalid,
        attributes: %{label_text: "Required", invalid: true, invalid_text: "Pick a value"},
        slots: [
          ~S|<:item value="one">One</:item>
<:item value="two">Two</:item>|
        ]
      }
    ]
  end
end

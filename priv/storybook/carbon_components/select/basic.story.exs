defmodule Storybook.CarbonComponents.Select.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.select/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{name: "select-default"},
        slots: [
          ~S|<:label_text>Select an option</:label_text>
<:item value="">Choose one</:item>
<:item value="option-1">Option 1</:item>
<:item value="option-2">Option 2</:item>
<:item value="option-3">Option 3</:item>|
        ]
      },
      %Variation{
        id: :inline,
        attributes: %{name: "select-inline", inline: true},
        slots: [
          ~S|<:label_text>Inline</:label_text>
<:item value="alpha">Alpha</:item>
<:item value="beta">Beta</:item>|
        ]
      },
      %Variation{
        id: :invalid,
        attributes: %{name: "select-invalid", invalid: true, invalid_text: "Pick a value"},
        slots: [
          ~S|<:label_text>Required</:label_text>
<:item value="one">One</:item>
<:item value="two">Two</:item>|
        ]
      }
    ]
  end
end

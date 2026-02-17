defmodule Storybook.CarbonComponents.MultiSelect.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.multi_select/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{title_text: "Choose multiple"},
        slots: [
          ~S|<:item value="one">Option 1</:item>
<:item value="two">Option 2</:item>
<:item value="three">Option 3</:item>|
        ]
      },
      %Variation{
        id: :inline,
        attributes: %{title_text: "Inline", type: "inline"},
        slots: [
          ~S|<:item value="alpha">Alpha</:item>
<:item value="beta">Beta</:item>|
        ]
      },
      %Variation{
        id: :disabled,
        attributes: %{title_text: "Disabled", disabled: true},
        slots: [
          ~S|<:item value="one">Option 1</:item>
<:item value="two">Option 2</:item>|
        ]
      }
    ]
  end
end

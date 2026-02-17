defmodule Storybook.CarbonComponents.List.Unordered do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.unordered_list/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          ~S|<:item>First item</:item>
<:item>Second item</:item>
<:item>Third item</:item>|
        ]
      },
      %Variation{
        id: :nested,
        attributes: %{nested: true},
        slots: [
          ~S|<:item>Outer item</:item>
<:item>Another item</:item>|
        ]
      },
      %Variation{
        id: :expressive,
        attributes: %{is_expressive: true},
        slots: [
          ~S|<:item>Expressive one</:item>
<:item>Expressive two</:item>|
        ]
      }
    ]
  end
end

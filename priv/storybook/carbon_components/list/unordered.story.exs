defmodule Storybook.CarbonComponents.List.Unordered do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.unordered_list/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          ~S|<Graphene.CarbonComponents.list_item>First item</Graphene.CarbonComponents.list_item>
<Graphene.CarbonComponents.list_item>Second item</Graphene.CarbonComponents.list_item>
<Graphene.CarbonComponents.list_item>Third item</Graphene.CarbonComponents.list_item>|
        ]
      },
      %Variation{
        id: :nested,
        attributes: %{nested: true},
        slots: [
          ~S|<Graphene.CarbonComponents.list_item>Outer item</Graphene.CarbonComponents.list_item>
<Graphene.CarbonComponents.list_item>Another item</Graphene.CarbonComponents.list_item>|
        ]
      },
      %Variation{
        id: :expressive,
        attributes: %{is_expressive: true},
        slots: [
          ~S|<Graphene.CarbonComponents.list_item>Expressive one</Graphene.CarbonComponents.list_item>
<Graphene.CarbonComponents.list_item>Expressive two</Graphene.CarbonComponents.list_item>|
        ]
      }
    ]
  end
end

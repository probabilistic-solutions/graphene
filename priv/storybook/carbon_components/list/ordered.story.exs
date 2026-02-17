defmodule Storybook.CarbonComponents.List.Ordered do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.ordered_list/1

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
        id: :native,
        attributes: %{native: true},
        slots: [
          ~S|<Graphene.CarbonComponents.list_item>Step one</Graphene.CarbonComponents.list_item>
<Graphene.CarbonComponents.list_item>Step two</Graphene.CarbonComponents.list_item>|
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

defmodule Storybook.CarbonComponents.ContainedList.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.contained_list/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          ~S|<:label>Contained list</:label>
<:item>First item</:item>
<:item>Second item</:item>
<:item>Third item</:item>|
        ]
      },
      %Variation{
        id: :interactive,
        slots: [
          ~S|<:label>Clickable list</:label>
<:item clickable={true}>Clickable item</:item>
<:item clickable={true}>Another action</:item>
<:item disabled={true}>Disabled</:item>|
        ]
      },
      %VariationGroup{
        id: :sizes,
        variations:
          for size <- ~w(sm md lg) do
              %Variation{
                id: String.to_atom(size),
                attributes: %{size: size},
                slots: [
                  ~s|<:label>Size #{size}</:label>
<:item>Alpha</:item>
<:item>Beta</:item>|
                ]
              }
          end
      }
    ]
  end
end

defmodule Storybook.CarbonComponents.ContainedList.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.contained_list/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{label: "Contained list"},
        slots: [
          ~S|<:item>First item</:item>
<:item>Second item</:item>
<:item>Third item</:item>|
        ]
      },
      %Variation{
        id: :interactive,
        attributes: %{label: "Clickable list"},
        slots: [
          ~S|<:item clickable={true}>Clickable item</:item>
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
              attributes: %{label: "Size #{size}", size: size},
              slots: [
                ~S|<:item>Alpha</:item>
<:item>Beta</:item>|
              ]
            }
          end
      }
    ]
  end
end

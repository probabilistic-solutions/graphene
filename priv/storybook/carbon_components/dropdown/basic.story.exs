defmodule Storybook.CarbonComponents.Dropdown.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.dropdown/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{title_text: "Dropdown", value: "all"},
        slots: [
          ~S|<:item value="all">All</:item>
<:item value="cloud">Cloud</:item>
<:item value="edge">Edge</:item>|
        ]
      },
      %Variation{
        id: :inline,
        attributes: %{title_text: "Inline", type: "inline", value: "alpha"},
        slots: [
          ~S|<:item value="alpha">Alpha</:item>
<:item value="beta">Beta</:item>
<:item value="gamma">Gamma</:item>|
        ]
      },
      %VariationGroup{
        id: :sizes,
        variations:
          for size <- ~w(sm md lg) do
            %Variation{
              id: String.to_atom(size),
              attributes: %{title_text: "Size #{size}", size: size, value: "one"},
              slots: [
                ~S|<:item value="one">One</:item>
<:item value="two">Two</:item>|
              ]
            }
          end
      }
    ]
  end
end

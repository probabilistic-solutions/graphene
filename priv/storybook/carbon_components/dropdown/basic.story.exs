defmodule Storybook.CarbonComponents.Dropdown.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.dropdown/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{name: "dropdown-default", value: "all"},
        slots: [
          ~S|<:title_text>Dropdown</:title_text>
<:item value="all">All</:item>
<:item value="cloud">Cloud</:item>
<:item value="edge">Edge</:item>|
        ]
      },
      %Variation{
        id: :inline,
        attributes: %{name: "dropdown-inline", type: "inline", value: "alpha"},
        slots: [
          ~S|<:title_text>Inline</:title_text>
<:item value="alpha">Alpha</:item>
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
              attributes: %{name: "dropdown-#{size}", size: size, value: "one"},
              slots: [
                ~s|<:title_text>Size #{size}</:title_text>
<:item value="one">One</:item>
<:item value="two">Two</:item>|
              ]
            }
          end
      }
    ]
  end
end

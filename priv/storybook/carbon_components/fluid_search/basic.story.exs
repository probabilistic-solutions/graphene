defmodule Storybook.CarbonComponents.FluidSearch.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.fluid_search/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{label_text: "Search", placeholder: "Search"}
      },
      %Variation{
        id: :expandable,
        attributes: %{label_text: "Search", expandable: true, expanded: true}
      },
      %Variation{
        id: :disabled,
        attributes: %{label_text: "Search", disabled: true}
      },
      %VariationGroup{
        id: :sizes,
        variations:
          for size <- ~w(sm md lg) do
            %Variation{
              id: String.to_atom(size),
              attributes: %{label_text: "Size #{size}", size: size}
            }
          end
      }
    ]
  end
end

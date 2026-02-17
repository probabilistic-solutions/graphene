defmodule Storybook.CarbonComponents.Search.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.search/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{name: "search-default", label_text: "Search", placeholder: "Search"}
      },
      %Variation{
        id: :expandable,
        attributes: %{name: "search-expandable", label_text: "Search", expandable: true, expanded: true}
      },
      %VariationGroup{
        id: :sizes,
        variations:
          for size <- ~w(sm md lg) do
            %Variation{
              id: String.to_atom(size),
              attributes: %{name: "search-#{size}", label_text: "Size #{size}", size: size}
            }
          end
      }
    ]
  end
end

defmodule Storybook.CarbonComponents.Tag.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.tag/1

  def variations do
    [
      %Variation{
        id: :blue,
        attributes: %{type: "blue"},
        slots: ["Blue"]
      },
      %Variation{
        id: :green,
        attributes: %{type: "green"},
        slots: ["Green"]
      },
      %Variation{
        id: :filter,
        attributes: %{filter: true, type: "teal"},
        slots: ["Filter"]
      },
      %VariationGroup{
        id: :sizes,
        variations:
          for size <- ~w(sm md lg) do
            %Variation{
              id: String.to_atom(size),
              attributes: %{size: size, type: "cool-gray"},
              slots: ["#{String.upcase(size)}"]
            }
          end
      }
    ]
  end
end

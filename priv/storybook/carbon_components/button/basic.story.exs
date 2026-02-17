defmodule Storybook.CarbonComponents.Button.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.button/1

  def variations do
    [
      %Variation{
        id: :primary,
        slots: ["Primary"]
      },
      %VariationGroup{
        id: :kinds,
        variations:
          for kind <- ~w(secondary tertiary ghost danger) do
            %Variation{
              id: String.to_atom(kind),
              attributes: %{kind: kind},
              slots: [String.capitalize(kind)]
            }
          end
      },
      %VariationGroup{
        id: :sizes,
        variations:
          for size <- ~w(sm md lg) do
            %Variation{
              id: String.to_atom(size),
              attributes: %{size: size},
              slots: ["Size #{size}"]
            }
          end
      },
      %Variation{
        id: :disabled,
        attributes: %{disabled: true},
        slots: ["Disabled"]
      }
    ]
  end
end

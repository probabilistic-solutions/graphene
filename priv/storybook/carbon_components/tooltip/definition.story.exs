defmodule Storybook.CarbonComponents.Tooltip.Definition do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.definition_tooltip/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: ["Tooltip"]
      },
      %Variation{
        id: :short,
        slots: ["AI"]
      },
      %Variation{
        id: :long,
        slots: ["Confidence score"]
      }
    ]
  end
end

defmodule Storybook.CarbonComponents.Heading do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.heading/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: ["Section heading"]
      },
      %Variation{
        id: :short,
        slots: ["Overview"]
      },
      %Variation{
        id: :long,
        slots: ["Project timeline and deliverables"]
      }
    ]
  end
end

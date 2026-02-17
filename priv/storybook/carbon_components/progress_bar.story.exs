defmodule Storybook.CarbonComponents.ProgressBar do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.progress_bar/1

  def variations do
    [
      %Variation{
        id: :quarter,
        attributes: %{value: "25", max: "100"}
      },
      %Variation{
        id: :half,
        attributes: %{value: "50", max: "100"}
      },
      %Variation{
        id: :complete,
        attributes: %{value: "100", max: "100"}
      }
    ]
  end
end

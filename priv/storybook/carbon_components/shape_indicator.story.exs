defmodule Storybook.CarbonComponents.ShapeIndicator do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.shape_indicator/1

  def variations do
    [
      %Variation{
        id: :success,
        attributes: %{kind: "success", label: "Success"}
      },
      %Variation{
        id: :failed,
        attributes: %{kind: "failed", label: "Failed"}
      },
      %Variation{
        id: :warning,
        attributes: %{kind: "warning", label: "Warning"}
      }
    ]
  end
end

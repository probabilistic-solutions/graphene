defmodule Storybook.CarbonComponents.IconIndicator do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.icon_indicator/1

  def variations do
    [
      %Variation{
        id: :failed,
        attributes: %{kind: "failed", label: "Failed"}
      },
      %Variation{
        id: :succeeded,
        attributes: %{kind: "succeeded", label: "Succeeded"}
      },
      %Variation{
        id: :informative,
        attributes: %{kind: "informative", label: "Informative"}
      },
      %Variation{
        id: :large,
        attributes: %{kind: "succeeded", label: "Large", size: "20"}
      }
    ]
  end
end

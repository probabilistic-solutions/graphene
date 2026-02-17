defmodule Storybook.CarbonComponents.InlineLoading.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.inline_loading/1

  def variations do
    [
      %Variation{
        id: :active,
        attributes: %{status: "active"},
        slots: ["Loading..."]
      },
      %Variation{
        id: :finished,
        attributes: %{status: "finished"},
        slots: ["Complete"]
      },
      %Variation{
        id: :error,
        attributes: %{status: "error"},
        slots: ["Failed"]
      }
    ]
  end
end

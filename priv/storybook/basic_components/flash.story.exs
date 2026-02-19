defmodule Storybook.BasicComponents.Flash do
  use PhoenixStorybook.Story, :component
  use Graphene, [:html, :live]

  def function, do: &Graphene.BasicComponents.flash/1

  def variations do
    [
      %Variation{
        id: :info,
        attributes: %{kind: :info, title: "Info"},
        slots: ["Everything is working."]
      },
      %Variation{
        id: :error,
        attributes: %{kind: :error, title: "Error"},
        slots: ["Request failed."]
      }
    ]
  end
end

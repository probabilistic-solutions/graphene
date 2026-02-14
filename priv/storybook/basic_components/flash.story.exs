defmodule Storybook.BasicComponents.Flash do
  use PhoenixStorybook.Story, :component

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
        slots: ["Something went wrong."]
      }
    ]
  end
end

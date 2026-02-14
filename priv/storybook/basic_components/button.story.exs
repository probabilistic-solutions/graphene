defmodule Storybook.BasicComponents.Button do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.BasicComponents.button/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: ["Button"]
      },
      %Variation{
        id: :primary,
        attributes: %{variant: "primary"},
        slots: ["Primary"]
      },
      %Variation{
        id: :secondary,
        attributes: %{kind: "secondary"},
        slots: ["Secondary"]
      },
      %Variation{
        id: :ghost,
        attributes: %{kind: "ghost"},
        slots: ["Ghost"]
      },
      %Variation{
        id: :disabled,
        attributes: %{disabled: true},
        slots: ["Disabled"]
      }
    ]
  end
end

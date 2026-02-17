defmodule Storybook.CarbonComponents.CopyButton do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.copy_button/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: ["Copy"]
      },
      %Variation{
        id: :top_align,
        attributes: %{align: "top"},
        slots: ["Copy"]
      },
      %Variation{
        id: :disabled,
        attributes: %{disabled: true, feedback: "Copied"},
        slots: ["Copy"]
      }
    ]
  end
end

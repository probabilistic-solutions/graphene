defmodule Storybook.CarbonComponents.ComboButton do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.combo_button/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{label: "Primary action", size: "lg"},
        slots: [
          ~S|<:item label="Second action" />
<:item label="Third action" />
<:item label="Danger action" divider kind="danger" />|
        ]
      },
      %Variation{
        id: :small,
        attributes: %{label: "Small combo", size: "sm"},
        slots: [
          ~S|<:item label="Secondary" />
<:item label="Tertiary" />|
        ]
      },
      %Variation{
        id: :disabled,
        attributes: %{label: "Disabled", disabled: true},
        slots: [
          ~S|<:item label="Secondary" />
<:item label="Tertiary" />|
        ]
      }
    ]
  end
end

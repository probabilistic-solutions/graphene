defmodule Storybook.CarbonComponents.ComboButton do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.combo_button/1

  def doc do
    Storybook.Doc.markdown("""
Combo buttons expose a primary action with a secondary menu of alternatives.
Use them when one action is the default but related options are still needed.

Pair .combo_button with .menu_item actions and align it with other toolbar
.button actions.
""")
  end

  

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

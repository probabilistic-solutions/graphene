defmodule Storybook.CarbonComponents.MenuButton do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.menu_button/1

  def doc do
    Storybook.Doc.markdown("""
Menu buttons open a menu of related actions from a single control. Use them when
actions are secondary and should be grouped.

Combine .menu_button with .table_toolbar or header actions and keep the primary
action elsewhere when needed.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{label: "Actions", kind: "primary", size: "lg"},
        slots: [
          ~S|<:item label="First action" />
<:item label="Second action" />
<:item label="Third action" disabled />|
        ]
      },
      %Variation{
        id: :ghost,
        attributes: %{label: "Menu", kind: "ghost", size: "md"},
        slots: [
          ~S|<:item label="Edit" />
<:item label="Delete" kind="danger" />|
        ]
      },
      %VariationGroup{
        id: :sizes,
        description: "Size variants",
        note: "Use sm in compact toolbars and lg for prominent menus.",
        variations:
          for size <- ~w(sm md lg) do
            %Variation{
              id: String.to_atom(size),
              attributes: %{label: "Menu", size: size},
              slots: [
                ~S|<:item label="Item A" />
<:item label="Item B" />|
              ]
            }
          end
      }
    ]
  end
end

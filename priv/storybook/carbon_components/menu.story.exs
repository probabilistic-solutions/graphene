defmodule Storybook.CarbonComponents.Menu do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.menu/1

  def doc do
    Storybook.Doc.markdown("""
Menus are contextual lists of actions. Use them when multiple secondary actions
belong to a trigger element.

Pair .menu with .menu_button or .overflow_menu and keep menu items short and
action-focused.
""")
  end

  def template do
    """
    <div class="psb" style="position: relative; min-height: 240px;">
      <.psb-variation/>
    </div>
    """
  end

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{label: "Actions", open: true, size: "lg", x: 200, y: 140},
        slots: [
          ~S|<Graphene.CarbonComponents.menu_item label="First action" />
<Graphene.CarbonComponents.menu_item label="Second action" />
<Graphene.CarbonComponents.menu_item_divider />
<Graphene.CarbonComponents.menu_item kind="danger" label="Danger action" />|
        ]
      },
      %Variation{
        id: :secondary,
        attributes: %{label: "More", open: true, size: "md", x: 520, y: 140},
        slots: [
          ~S|<Graphene.CarbonComponents.menu_item label="Edit" />
<Graphene.CarbonComponents.menu_item label="Duplicate" />|
        ]
      },
      %VariationGroup{
        id: :sizes,
        description: "Menu sizing",
        note: "Keep menu size consistent on a page and use smaller sizes for dense toolbars.",
        variations:
          for {size, index} <- Enum.with_index(~w(sm md lg xl)) do
            %Variation{
              id: String.to_atom(size),
              attributes: %{
                label: "Menu",
                open: true,
                size: size,
                x: 200 + index * 220,
                y: 360
              },
              slots: [
                ~S|<Graphene.CarbonComponents.menu_item label="Item A" />
<Graphene.CarbonComponents.menu_item label="Item B" />|
              ]
            }
          end
      }
    ]
  end
end

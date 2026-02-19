defmodule Storybook.CarbonComponents.Menu do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.menu/1

  def container,
    do:
      {:iframe,
       style:
         "display: flex; flex-direction: column; justify-content: center; align-items: center; " <>
           "margin: 0; gap: 5px; padding: 5px; min-height: 240px;"}

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

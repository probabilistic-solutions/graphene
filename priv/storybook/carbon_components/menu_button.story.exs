defmodule Storybook.CarbonComponents.MenuButton do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.menu_button/1

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

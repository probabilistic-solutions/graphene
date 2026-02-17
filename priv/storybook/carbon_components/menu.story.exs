defmodule Storybook.CarbonComponents.Menu do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.menu/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{label: "Actions", kind: "primary", size: "lg"},
        slots: [
          ~S|<:item label="First action" />
<:item label="Second action" />
<:item label="Danger action" divider kind="danger" />|
        ]
      },
      %Variation{
        id: :secondary,
        attributes: %{label: "More", kind: "secondary", size: "md"},
        slots: [
          ~S|<:item label="Edit" />
<:item label="Duplicate" />|
        ]
      },
      %VariationGroup{
        id: :sizes,
        variations:
          for size <- ~w(sm md lg xl) do
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

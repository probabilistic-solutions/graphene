defmodule Storybook.CarbonComponents.ContentSwitcher.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.content_switcher/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{value: "files"},
        slots: [
          ~S|<:item value="files">Files</:item>
<:item value="settings">Settings</:item>|
        ]
      },
      %Variation{
        id: :low_contrast,
        attributes: %{value: "tasks", low_contrast: true},
        slots: [
          ~S|<:item value="tasks">Tasks</:item>
<:item value="insights">Insights</:item>
<:item value="team">Team</:item>|
        ]
      },
      %VariationGroup{
        id: :sizes,
        variations:
          for size <- ~w(sm md lg xl) do
            %Variation{
              id: String.to_atom(size),
              attributes: %{value: "one", size: size},
              slots: [
                ~S|<:item value="one">One</:item>
<:item value="two">Two</:item>|
              ]
            }
          end
      }
    ]
  end
end

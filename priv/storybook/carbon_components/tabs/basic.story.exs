defmodule Storybook.CarbonComponents.Tabs.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.tabs/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          ~S|<:tab target="tab-panel-1" title="First">First</:tab>
<:tab target="tab-panel-2" title="Second">Second</:tab>|
        ]
      },
      %Variation{
        id: :contained,
        attributes: %{type: "contained"},
        slots: [
          ~S|<:tab target="tab-panel-a" title="Overview">Overview</:tab>
<:tab target="tab-panel-b" title="Details">Details</:tab>
<:tab target="tab-panel-c" title="Activity">Activity</:tab>|
        ]
      },
      %VariationGroup{
        id: :sizes,
        variations:
          for size <- ~w(sm md lg xl) do
            %Variation{
              id: String.to_atom(size),
              attributes: %{size: size},
              slots: [
                ~S|<:tab target="tab-panel-one" title="One">One</:tab>
<:tab target="tab-panel-two" title="Two">Two</:tab>|
              ]
            }
          end
      }
    ]
  end
end

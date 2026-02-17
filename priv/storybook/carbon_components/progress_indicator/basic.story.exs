defmodule Storybook.CarbonComponents.ProgressIndicator.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.progress_indicator/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{current_index: "1"},
        slots: [
          ~S|<:step label="First" complete />
<:step label="Second" current />
<:step label="Third" />|
        ]
      },
      %Variation{
        id: :vertical,
        attributes: %{current_index: "2", vertical: true},
        slots: [
          ~S|<:step label="Plan" complete />
<:step label="Build" complete />
<:step label="Launch" current />
<:step label="Iterate" />|
        ]
      },
      %Variation{
        id: :spaced,
        attributes: %{current_index: "0", space_equally: true},
        slots: [
          ~S|<:step label="Step one" current />
<:step label="Step two" />
<:step label="Step three" />|
        ]
      }
    ]
  end
end

defmodule Storybook.CarbonComponents.Stack do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.stack/1

  def doc do
    Storybook.Doc.markdown("""
Stack arranges items with consistent spacing in one direction. Use it to align
tags, buttons, or status chips without custom CSS.

Combine .stack with .grid or .tile for layout structure and adjust gap to match
density needs.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :horizontal,
        attributes: %{orientation: "horizontal", gap: "4"},
        slots: [
          ~S|<Graphene.CarbonComponents.tag type="green">One</Graphene.CarbonComponents.tag>
<Graphene.CarbonComponents.tag type="blue">Two</Graphene.CarbonComponents.tag>
<Graphene.CarbonComponents.tag type="red">Three</Graphene.CarbonComponents.tag>|
        ]
      },
      %Variation{
        id: :vertical,
        attributes: %{orientation: "vertical", gap: "3"},
        slots: [
          ~S|<Graphene.CarbonComponents.tag type="purple">Alpha</Graphene.CarbonComponents.tag>
<Graphene.CarbonComponents.tag type="cool-gray">Beta</Graphene.CarbonComponents.tag>|
        ]
      },
      %Variation{
        id: :tight,
        attributes: %{orientation: "horizontal", gap: "2"},
        slots: [
          ~S|<Graphene.CarbonComponents.tag type="magenta">A</Graphene.CarbonComponents.tag>
<Graphene.CarbonComponents.tag type="cyan">B</Graphene.CarbonComponents.tag>
<Graphene.CarbonComponents.tag type="teal">C</Graphene.CarbonComponents.tag>|
        ]
      }
    ]
  end
end

defmodule Storybook.CarbonComponents.Tooltip.Basic do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.tooltip/1

  def doc do
    Storybook.Doc.markdown("""
Tooltips provide short, non-essential hints on hover or focus. Use them for
icon-only controls or terse labels.

Pair .tooltip with .icon_button and avoid placing critical instructions inside.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :bottom,
        attributes: %{align: "bottom"},
        slots: [
          ~S|<:trigger>
  <Graphene.CarbonComponents.button kind="ghost" aria-labelledby="tooltip-content">Hover me</Graphene.CarbonComponents.button>
</:trigger>
<:content id="tooltip-content">Tooltip content</:content>|
        ]
      },
      %Variation{
        id: :top,
        attributes: %{align: "top"},
        slots: [
          ~S|<:trigger>
  <Graphene.CarbonComponents.button kind="ghost" aria-labelledby="tooltip-top">Top tooltip</Graphene.CarbonComponents.button>
</:trigger>
<:content id="tooltip-top">Top content</:content>|
        ]
      },
      %Variation{
        id: :right,
        attributes: %{align: "right"},
        slots: [
          ~S|<:trigger>
  <Graphene.CarbonComponents.button kind="ghost" aria-labelledby="tooltip-right">Right tooltip</Graphene.CarbonComponents.button>
</:trigger>
<:content id="tooltip-right">Right content</:content>|
        ]
      }
    ]
  end
end

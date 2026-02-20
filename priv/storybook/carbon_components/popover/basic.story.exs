defmodule Storybook.CarbonComponents.Popover.Basic do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.popover/1

  def doc do
    Storybook.Doc.markdown("""
Popovers are layered containers for rich, contextual content. Use them for
detail previews or lightweight controls.

Combine .popover with .link or .button triggers and avoid critical tasks that
should live in a full modal.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :bottom,
        attributes: %{align: "bottom"},
        slots: [
          ~S|<:trigger>
  <Graphene.CarbonComponents.button kind="secondary">Open popover</Graphene.CarbonComponents.button>
</:trigger>
<:content>
  <p>Popover content goes here.</p>
</:content>|
        ]
      },
      %Variation{
        id: :top,
        attributes: %{align: "top"},
        slots: [
          ~S|<:trigger>
  <Graphene.CarbonComponents.button kind="secondary">Top popover</Graphene.CarbonComponents.button>
</:trigger>
<:content>
  <p>Top aligned content.</p>
</:content>|
        ]
      },
      %Variation{
        id: :right,
        attributes: %{align: "right"},
        slots: [
          ~S|<:trigger>
  <Graphene.CarbonComponents.button kind="secondary">Right popover</Graphene.CarbonComponents.button>
</:trigger>
<:content>
  <p>Right aligned content.</p>
</:content>|
        ]
      }
    ]
  end
end

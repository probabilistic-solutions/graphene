defmodule Storybook.CarbonComponents.Toggletip do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.toggletip/1

  def doc do
    Storybook.Doc.markdown("""
Toggletips reveal brief, interactive help on click. Use them when users may need
extra context or a small action without leaving the page.

Include .link or small .button actions inside the toggletip and keep the content
short.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{alignment: "bottom", default_open: true},
        slots: [
          ~S|Toggletip label
<:body_text>
  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
</:body_text>
<:action>
  <Graphene.CarbonComponents.link href="#">Link action</Graphene.CarbonComponents.link>
</:action>
<:action>
  <Graphene.CarbonComponents.button size="sm">Button</Graphene.CarbonComponents.button>
</:action>|
        ]
      },
      %Variation{
        id: :top,
        attributes: %{alignment: "top"},
        slots: [
          ~S|Info
<:body_text>
  <p>More details about this option.</p>
</:body_text>|
        ]
      },
      %Variation{
        id: :right,
        attributes: %{alignment: "right"},
        slots: [
          ~S|Help
<:body_text>
  <p>Short description goes here.</p>
</:body_text>
<:action>
  <Graphene.CarbonComponents.button size="sm">Got it</Graphene.CarbonComponents.button>
</:action>|
        ]
      }
    ]
  end
end

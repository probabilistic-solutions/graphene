defmodule Storybook.CarbonComponents.Toggletip do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.toggletip/1

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
<:actions>
  <Graphene.CarbonComponents.link href="#">Link action</Graphene.CarbonComponents.link>
</:actions>
<:actions>
  <Graphene.CarbonComponents.button size="sm">Button</Graphene.CarbonComponents.button>
</:actions>|
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
<:actions>
  <Graphene.CarbonComponents.button size="sm">Got it</Graphene.CarbonComponents.button>
</:actions>|
        ]
      }
    ]
  end
end

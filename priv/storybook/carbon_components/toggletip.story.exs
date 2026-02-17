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
<p slot="body-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
<Graphene.CarbonComponents.link href="#" slot="actions">Link action</Graphene.CarbonComponents.link>
<Graphene.CarbonComponents.button size="sm" slot="actions">Button</Graphene.CarbonComponents.button>|
        ]
      },
      %Variation{
        id: :top,
        attributes: %{alignment: "top"},
        slots: [
          ~S|Info
<p slot="body-text">More details about this option.</p>|
        ]
      },
      %Variation{
        id: :right,
        attributes: %{alignment: "right"},
        slots: [
          ~S|Help
<p slot="body-text">Short description goes here.</p>
<Graphene.CarbonComponents.button size="sm" slot="actions">Got it</Graphene.CarbonComponents.button>|
        ]
      }
    ]
  end
end

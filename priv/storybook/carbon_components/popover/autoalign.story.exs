defmodule Storybook.CarbonComponents.Popover.AutoAlign do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.popover/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{autoalign: true, alignment_axis_offset: "8"},
        slots: [
          ~S|<:trigger>
  <Graphene.CarbonComponents.button kind="secondary">Auto align popover</Graphene.CarbonComponents.button>
</:trigger>
<:content>
  <p>Auto-aligned popover content.</p>
</:content>|
        ]
      },
      %Variation{
        id: :offset_16,
        attributes: %{autoalign: true, alignment_axis_offset: "16"},
        slots: [
          ~S|<:trigger>
  <Graphene.CarbonComponents.button kind="secondary">Offset 16</Graphene.CarbonComponents.button>
</:trigger>
<:content>
  <p>Offset axis example.</p>
</:content>|
        ]
      },
      %Variation{
        id: :with_caret,
        attributes: %{autoalign: true, caret: true, border: true},
        slots: [
          ~S|<:trigger>
  <Graphene.CarbonComponents.button kind="secondary">Caret popover</Graphene.CarbonComponents.button>
</:trigger>
<:content>
  <p>Auto align with caret.</p>
</:content>|
        ]
      }
    ]
  end
end

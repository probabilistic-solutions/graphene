defmodule Storybook.CarbonComponents.OverflowMenu.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.overflow_menu/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          ~S|<:s-icon>
  <span aria-hidden="true">...</span>
</:s-icon>
<span slot="tooltip-content">Options</span>
<:item>Action 1</:item>
<:item>Action 2</:item>
<:item danger>Delete</:item>|
        ]
      },
      %Variation{
        id: :autoalign,
        attributes: %{autoalign: true},
        slots: [
          ~S|<:s-icon>
  <span aria-hidden="true">...</span>
</:s-icon>
<span slot="tooltip-content">Auto align</span>
<:item>Edit</:item>
<:item>Duplicate</:item>|
        ]
      },
      %Variation{
        id: :disabled,
        attributes: %{disabled: true},
        slots: [
          ~S|<:s-icon>
  <span aria-hidden="true">...</span>
</:s-icon>
<span slot="tooltip-content">Disabled</span>
<:item>Action 1</:item>|
        ]
      }
    ]
  end
end

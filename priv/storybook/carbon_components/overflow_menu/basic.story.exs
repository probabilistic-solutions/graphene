defmodule Storybook.CarbonComponents.OverflowMenu.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.overflow_menu/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          ~S|<:icon>
  <Graphene.Icons.icon fit="width" name="overflow-menu--horizontal" />
</:icon>
<:tooltip_content>Options</:tooltip_content>
<:item>Action 1</:item>
<:item>Action 2</:item>
<:item danger>Delete</:item>|
        ]
      },
      %Variation{
        id: :autoalign,
        attributes: %{autoalign: true},
        slots: [
          ~S|<:icon>
  <Graphene.Icons.icon fit="width" name="overflow-menu--horizontal" />
</:icon>
<:tooltip_content>Auto align</:tooltip_content>
<:item>Edit</:item>
<:item>Duplicate</:item>|
        ]
      },
      %Variation{
        id: :disabled,
        attributes: %{disabled: true},
        slots: [
          ~S|<:icon>
  <Graphene.Icons.icon fit="width" name="overflow-menu--horizontal" />
</:icon>
<:tooltip_content>Disabled</:tooltip_content>
<:item>Action 1</:item>|
        ]
      }
    ]
  end
end

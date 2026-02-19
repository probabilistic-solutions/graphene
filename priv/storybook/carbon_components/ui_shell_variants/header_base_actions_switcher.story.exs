defmodule Storybook.CarbonComponents.UIShell.Variants.HeaderBaseActionsSwitcher do
  use PhoenixStorybook.Story, :example

  alias Storybook.CarbonComponents.UIShell.Variants.Helpers

  def doc do
    "Header with actions and an app switcher panel."
  end

  def render(assigns) do
    ~H"""
    <Graphene.CarbonComponents.header aria-label="IBM Platform Name">
      <Graphene.CarbonComponents.header_name href="#" prefix="IBM">[Platform]</Graphene.CarbonComponents.header_name>
      <:global>
        <Graphene.CarbonComponents.header_global_action button_label_inactive="Search" tooltip_text="Search">
          <:icon name="search" size={20} />
        </Graphene.CarbonComponents.header_global_action>
        <Graphene.CarbonComponents.header_global_action button_label_inactive="Notification" tooltip_text="Notification">
          <:icon name="notification" size={20} />
        </Graphene.CarbonComponents.header_global_action>
        <Graphene.CarbonComponents.header_global_action
          button_label_active="Close switcher"
          button_label_inactive="Open switcher"
          tooltip_text="Open switcher"
          panel_id="switcher-panel"
          tooltip_alignment="right"
        >
          <:icon name="switcher" size={20} />
        </Graphene.CarbonComponents.header_global_action>
      </:global>
      <Graphene.CarbonComponents.header_panel id="switcher-panel" aria-label="Header Panel">
        <Graphene.CarbonComponents.switcher aria-label="Switcher Container">
          <Graphene.CarbonComponents.switcher_item aria-label="Link 1" href="#">Link 1</Graphene.CarbonComponents.switcher_item>
          <Graphene.CarbonComponents.switcher_divider />
          <Graphene.CarbonComponents.switcher_item aria-label="Link 2" href="#">Link 2</Graphene.CarbonComponents.switcher_item>
          <Graphene.CarbonComponents.switcher_item aria-label="Link 3" href="#">Link 3</Graphene.CarbonComponents.switcher_item>
          <Graphene.CarbonComponents.switcher_item aria-label="Link 4" href="#">Link 4</Graphene.CarbonComponents.switcher_item>
          <Graphene.CarbonComponents.switcher_item aria-label="Link 5" href="#">Link 5</Graphene.CarbonComponents.switcher_item>
          <Graphene.CarbonComponents.switcher_divider />
          <Graphene.CarbonComponents.switcher_item aria-label="Link 6" href="#">Link 6</Graphene.CarbonComponents.switcher_item>
        </Graphene.CarbonComponents.switcher>
      </Graphene.CarbonComponents.header_panel>
    </Graphene.CarbonComponents.header>
    <Helpers.story_content />
    """
  end
end

defmodule Storybook.CarbonComponents.UIShell.Variants.HeaderBaseActionsRightPanel do
  use PhoenixStorybook.Story, :example

  def doc do
    "Header with global actions and a right panel."
  end

  def render(assigns) do
    ~H"""
    <Graphene.CarbonComponents.header aria-label="IBM Platform Name">
      <Graphene.CarbonComponents.header_name href="#" prefix="IBM">[Platform]</Graphene.CarbonComponents.header_name>
      <:global>
        <Graphene.CarbonComponents.header_global_action button_label_inactive="Search" tooltip_text="Search">
          <:icon name="search" size={20} />
        </Graphene.CarbonComponents.header_global_action>
        <Graphene.CarbonComponents.header_global_action
          panel_id="notification-panel"
          button_label_inactive="Notification"
          tooltip_text="Notification"
        >
          <:icon name="notification" size={20} />
          <Graphene.CarbonComponents.badge_indicator count={4} />
        </Graphene.CarbonComponents.header_global_action>
        <Graphene.CarbonComponents.header_global_action
          button_label_inactive="App Switcher"
          tooltip_text="App Switcher"
          tooltip_alignment="right"
        >
          <:icon name="switcher" size={20} />
        </Graphene.CarbonComponents.header_global_action>
      </:global>
      <Graphene.CarbonComponents.header_panel id="notification-panel" aria-label="Header Panel" />
    </Graphene.CarbonComponents.header>
    """
  end
end

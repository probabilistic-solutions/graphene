defmodule Storybook.CarbonComponents.UIShell.Variants.HeaderBaseSkipToContent do
  use PhoenixStorybook.Story, :example

  alias Storybook.CarbonComponents.UIShell.Variants.Helpers

  def doc do
    "Header with skip-to-content and global actions."
  end

  def render(assigns) do
    ~H"""
    <Graphene.CarbonComponents.header aria-label="IBM Platform Name">
      <Graphene.CarbonComponents.skip_to_content />
      <Graphene.CarbonComponents.header_name href="#" prefix="IBM">[Platform]</Graphene.CarbonComponents.header_name>
      <:global>
        <Graphene.CarbonComponents.header_global_action button_label_inactive="Search" tooltip_text="Search">
          <:icon name="search" size={20} />
        </Graphene.CarbonComponents.header_global_action>
        <Graphene.CarbonComponents.header_global_action button_label_inactive="Notification" tooltip_text="Notification">
          <:icon name="notification" size={20} />
        </Graphene.CarbonComponents.header_global_action>
        <Graphene.CarbonComponents.header_global_action
          button_label_inactive="App Switcher"
          tooltip_text="App Switcher"
          tooltip_alignment="right"
        >
          <:icon name="switcher" size={20} />
        </Graphene.CarbonComponents.header_global_action>
      </:global>
    </Graphene.CarbonComponents.header>
    <Helpers.story_content />
    """
  end
end

defmodule Storybook.CarbonComponents.UIShell.Variants.SideNavRailHeader do
  use PhoenixStorybook.Story, :example

  alias Storybook.CarbonComponents.UIShell.Variants.Helpers

  def doc do
    "Header with a rail side nav."
  end

  def render(assigns) do
    ~H"""
    <Graphene.CarbonComponents.header aria-label="IBM Platform Name">
      <Graphene.CarbonComponents.header_menu_button button_label_active="Close menu" button_label_inactive="Open menu" />
      <Graphene.CarbonComponents.header_name href="#" prefix="IBM">[Platform]</Graphene.CarbonComponents.header_name>
      <Graphene.CarbonComponents.header_nav menu_bar_label="IBM [Platform]">
        <Graphene.CarbonComponents.header_nav_item href="#">Link 1</Graphene.CarbonComponents.header_nav_item>
        <Graphene.CarbonComponents.header_nav_item href="#">Link 2</Graphene.CarbonComponents.header_nav_item>
        <Graphene.CarbonComponents.header_nav_item href="#">Link 3</Graphene.CarbonComponents.header_nav_item>
        <Graphene.CarbonComponents.header_menu menu_label="Link 4" trigger_content="Link 4">
          <Graphene.CarbonComponents.header_menu_item href="#">Sub-link 1</Graphene.CarbonComponents.header_menu_item>
          <Graphene.CarbonComponents.header_menu_item href="#">Sub-link 2</Graphene.CarbonComponents.header_menu_item>
          <Graphene.CarbonComponents.header_menu_item href="#">Sub-link 3</Graphene.CarbonComponents.header_menu_item>
        </Graphene.CarbonComponents.header_menu>
      </Graphene.CarbonComponents.header_nav>
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
      <Graphene.CarbonComponents.side_nav aria-label="Side navigation" collapse_mode="rail">
        <Graphene.CarbonComponents.side_nav_items>
          <Graphene.CarbonComponents.side_nav_menu title="Category title">
            <:title_icon><Graphene.CarbonComponents.icon name="analytics" size={16} /></:title_icon>
            <Graphene.CarbonComponents.side_nav_menu_item href="#">Link</Graphene.CarbonComponents.side_nav_menu_item>
            <Graphene.CarbonComponents.side_nav_menu_item href="#" active aria_current="page">Link</Graphene.CarbonComponents.side_nav_menu_item>
            <Graphene.CarbonComponents.side_nav_menu_item href="#">Link</Graphene.CarbonComponents.side_nav_menu_item>
          </Graphene.CarbonComponents.side_nav_menu>
          <Graphene.CarbonComponents.side_nav_menu title="Category title">
            <:title_icon><Graphene.CarbonComponents.icon name="analytics" size={16} /></:title_icon>
            <Graphene.CarbonComponents.side_nav_menu_item href="#">Link</Graphene.CarbonComponents.side_nav_menu_item>
            <Graphene.CarbonComponents.side_nav_menu_item href="#">Link</Graphene.CarbonComponents.side_nav_menu_item>
            <Graphene.CarbonComponents.side_nav_menu_item href="#">Link</Graphene.CarbonComponents.side_nav_menu_item>
          </Graphene.CarbonComponents.side_nav_menu>
          <Graphene.CarbonComponents.side_nav_menu title="Category title">
            <:title_icon><Graphene.CarbonComponents.icon name="analytics" size={16} /></:title_icon>
            <Graphene.CarbonComponents.side_nav_menu_item href="#">Link</Graphene.CarbonComponents.side_nav_menu_item>
            <Graphene.CarbonComponents.side_nav_menu_item href="#">Link</Graphene.CarbonComponents.side_nav_menu_item>
            <Graphene.CarbonComponents.side_nav_menu_item href="#">Link</Graphene.CarbonComponents.side_nav_menu_item>
          </Graphene.CarbonComponents.side_nav_menu>
          <Graphene.CarbonComponents.side_nav_link href="#">
            <:title_icon_container><Graphene.CarbonComponents.icon name="analytics" size={16} /></:title_icon_container>
            Link
          </Graphene.CarbonComponents.side_nav_link>
          <Graphene.CarbonComponents.side_nav_link href="#">
            <:title_icon_container><Graphene.CarbonComponents.icon name="analytics" size={16} /></:title_icon_container>
            Link
          </Graphene.CarbonComponents.side_nav_link>
        </Graphene.CarbonComponents.side_nav_items>
      </Graphene.CarbonComponents.side_nav>
    </Graphene.CarbonComponents.header>
    <Helpers.story_content />
    """
  end
end

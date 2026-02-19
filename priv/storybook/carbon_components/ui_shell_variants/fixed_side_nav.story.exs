defmodule Storybook.CarbonComponents.UIShell.Variants.FixedSideNav do
  use PhoenixStorybook.Story, :example

  alias Storybook.CarbonComponents.UIShell.Variants.Helpers

  def doc do
    "Fixed side nav layout with standalone navigation and content."
  end

  def render(assigns) do
    ~H"""
    <Graphene.CarbonComponents.side_nav
      is_not_child_of_header
      usage_mode="regular"
      aria-label="Side navigation"
      collapse_mode="fixed"
      expanded
    >
      <Graphene.CarbonComponents.side_nav_items>
        <Graphene.CarbonComponents.side_nav_menu title="L0 menu">
          <Graphene.CarbonComponents.side_nav_menu_item href="#">L0 menu item</Graphene.CarbonComponents.side_nav_menu_item>
          <Graphene.CarbonComponents.side_nav_menu_item href="#">L0 menu item</Graphene.CarbonComponents.side_nav_menu_item>
          <Graphene.CarbonComponents.side_nav_menu_item href="#">L0 menu item</Graphene.CarbonComponents.side_nav_menu_item>
        </Graphene.CarbonComponents.side_nav_menu>
        <Graphene.CarbonComponents.side_nav_menu title="L0 menu">
          <Graphene.CarbonComponents.side_nav_menu_item href="#">L0 menu item</Graphene.CarbonComponents.side_nav_menu_item>
          <Graphene.CarbonComponents.side_nav_menu_item href="#" active aria_current="page" target="_blank">
            L0 menu item
          </Graphene.CarbonComponents.side_nav_menu_item>
          <Graphene.CarbonComponents.side_nav_menu_item href="#">L0 menu item</Graphene.CarbonComponents.side_nav_menu_item>
        </Graphene.CarbonComponents.side_nav_menu>
        <Graphene.CarbonComponents.side_nav_menu title="L0 menu">
          <Graphene.CarbonComponents.side_nav_menu_item href="#">L0 menu item</Graphene.CarbonComponents.side_nav_menu_item>
          <Graphene.CarbonComponents.side_nav_menu_item href="#">L0 menu item</Graphene.CarbonComponents.side_nav_menu_item>
          <Graphene.CarbonComponents.side_nav_menu_item href="#">L0 menu item</Graphene.CarbonComponents.side_nav_menu_item>
        </Graphene.CarbonComponents.side_nav_menu>
        <Graphene.CarbonComponents.side_nav_link href="#">L0 link</Graphene.CarbonComponents.side_nav_link>
        <Graphene.CarbonComponents.side_nav_link href="#">L0 link</Graphene.CarbonComponents.side_nav_link>
      </Graphene.CarbonComponents.side_nav_items>
    </Graphene.CarbonComponents.side_nav>
    <Helpers.story_content responsive_offset={false} />
    """
  end
end

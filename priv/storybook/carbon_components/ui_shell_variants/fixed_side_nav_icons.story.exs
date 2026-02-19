defmodule Storybook.CarbonComponents.UIShell.Variants.FixedSideNavIcons do
  use PhoenixStorybook.Story, :example

  alias Storybook.CarbonComponents.UIShell.Variants.Helpers

  def doc do
    "Fixed side nav with icon slots."
  end

  def render(assigns) do
    ~H"""
    <Graphene.CarbonComponents.side_nav is_not_child_of_header aria-label="Side navigation" collapse_mode="fixed" expanded>
      <Graphene.CarbonComponents.side_nav_items>
        <Graphene.CarbonComponents.side_nav_menu title="Category title">
          <:title_icon><Graphene.CarbonComponents.icon name="analytics" size={16} /></:title_icon>
          <Graphene.CarbonComponents.side_nav_menu_item href="#">Link</Graphene.CarbonComponents.side_nav_menu_item>
          <Graphene.CarbonComponents.side_nav_menu_item href="#">Link</Graphene.CarbonComponents.side_nav_menu_item>
          <Graphene.CarbonComponents.side_nav_menu_item href="#">Link</Graphene.CarbonComponents.side_nav_menu_item>
        </Graphene.CarbonComponents.side_nav_menu>
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
        <Graphene.CarbonComponents.side_nav_link href="#">
          <:title_icon><Graphene.CarbonComponents.icon name="analytics" size={16} /></:title_icon>
          Link
        </Graphene.CarbonComponents.side_nav_link>
        <Graphene.CarbonComponents.side_nav_link href="#">
          <:title_icon><Graphene.CarbonComponents.icon name="analytics" size={16} /></:title_icon>
          Link
        </Graphene.CarbonComponents.side_nav_link>
      </Graphene.CarbonComponents.side_nav_items>
    </Graphene.CarbonComponents.side_nav>
    <Helpers.story_content responsive_offset={false} />
    """
  end
end

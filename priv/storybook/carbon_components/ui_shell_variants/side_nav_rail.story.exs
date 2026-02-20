defmodule Storybook.CarbonComponents.UIShell.Variants.SideNavRail do
  use PhoenixStorybook.Story, :example

  alias Storybook.CarbonComponents.UIShell.Variants.Helpers

  def doc do
    "Side nav rail layout."
  end

  def render(assigns) do
    ~H"""
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
    <Helpers.story_content />
    """
  end
end

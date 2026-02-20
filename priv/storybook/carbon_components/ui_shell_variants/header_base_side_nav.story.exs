defmodule Storybook.CarbonComponents.UIShell.Variants.HeaderBaseSideNav do
  use PhoenixStorybook.Story, :example

  alias Storybook.CarbonComponents.UIShell.Variants.Helpers

  def doc do
    "Header with side nav."
  end

  def render(assigns) do
    ~H"""
    <Graphene.CarbonComponents.header aria-label="IBM Platform Name">
      <Graphene.CarbonComponents.header_menu_button button_label_active="Close menu" button_label_inactive="Open menu" />
      <Graphene.CarbonComponents.header_name href="#" prefix="IBM">[Platform]</Graphene.CarbonComponents.header_name>
      <Graphene.CarbonComponents.side_nav aria-label="Side navigation" collapse_mode="responsive">
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

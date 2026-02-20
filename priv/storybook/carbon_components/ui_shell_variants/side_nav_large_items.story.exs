defmodule Storybook.CarbonComponents.UIShell.Variants.SideNavLargeItems do
  use PhoenixStorybook.Story, :example

  alias Storybook.CarbonComponents.UIShell.Variants.Helpers

  def doc do
    "Side nav with large menu items."
  end

  def render(assigns) do
    ~H"""
    <Graphene.CarbonComponents.side_nav is_not_child_of_header aria-label="Side navigation" collapse_mode="fixed" expanded>
      <Graphene.CarbonComponents.side_nav_items>
        <Graphene.CarbonComponents.side_nav_menu large title="Large menu">
          <Graphene.CarbonComponents.side_nav_menu_item href="#">Menu 1</Graphene.CarbonComponents.side_nav_menu_item>
          <Graphene.CarbonComponents.side_nav_menu_item href="#">Menu 2</Graphene.CarbonComponents.side_nav_menu_item>
          <Graphene.CarbonComponents.side_nav_menu_item href="#">Menu 3</Graphene.CarbonComponents.side_nav_menu_item>
        </Graphene.CarbonComponents.side_nav_menu>
        <Graphene.CarbonComponents.side_nav_link large href="#">Large link</Graphene.CarbonComponents.side_nav_link>
        <Graphene.CarbonComponents.side_nav_menu large title="Large menu w/icon">
          <:title_icon><Graphene.CarbonComponents.icon name="analytics" size={16} /></:title_icon>
          <Graphene.CarbonComponents.side_nav_menu_item href="#">Menu 1</Graphene.CarbonComponents.side_nav_menu_item>
          <Graphene.CarbonComponents.side_nav_menu_item href="#">Menu 2</Graphene.CarbonComponents.side_nav_menu_item>
          <Graphene.CarbonComponents.side_nav_menu_item href="#">Menu 3</Graphene.CarbonComponents.side_nav_menu_item>
        </Graphene.CarbonComponents.side_nav_menu>
        <Graphene.CarbonComponents.side_nav_link large href="#">
          <:title_icon_container><Graphene.CarbonComponents.icon name="analytics" size={16} /></:title_icon_container>
          Large link w/icon
        </Graphene.CarbonComponents.side_nav_link>
      </Graphene.CarbonComponents.side_nav_items>
    </Graphene.CarbonComponents.side_nav>
    <Helpers.story_content />
    """
  end
end

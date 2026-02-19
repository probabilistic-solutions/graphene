defmodule Storybook.CarbonComponents.UIShell.Variants.HeaderBaseNavigation do
  use PhoenixStorybook.Story, :example

  def doc do
    "Header with navigation and a responsive side nav."
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
          <Graphene.CarbonComponents.header_menu_item is_active href="#">Sub-link 2</Graphene.CarbonComponents.header_menu_item>
          <Graphene.CarbonComponents.header_menu_item href="#">Sub-link 3</Graphene.CarbonComponents.header_menu_item>
        </Graphene.CarbonComponents.header_menu>
      </Graphene.CarbonComponents.header_nav>
      <Graphene.CarbonComponents.side_nav is_not_persistent aria-label="Side navigation" collapse_mode="responsive">
        <Graphene.CarbonComponents.side_nav_items>
          <Graphene.CarbonComponents.side_nav_link href="#">Link 1</Graphene.CarbonComponents.side_nav_link>
          <Graphene.CarbonComponents.side_nav_link href="#">Link 2</Graphene.CarbonComponents.side_nav_link>
          <Graphene.CarbonComponents.side_nav_link href="#">Link 3</Graphene.CarbonComponents.side_nav_link>
          <Graphene.CarbonComponents.side_nav_menu title="Link 4">
            <Graphene.CarbonComponents.side_nav_menu_item href="#">Sub-link 1</Graphene.CarbonComponents.side_nav_menu_item>
            <Graphene.CarbonComponents.side_nav_menu_item href="#">Sub-link 2</Graphene.CarbonComponents.side_nav_menu_item>
            <Graphene.CarbonComponents.side_nav_menu_item href="#">Sub-link 3</Graphene.CarbonComponents.side_nav_menu_item>
          </Graphene.CarbonComponents.side_nav_menu>
        </Graphene.CarbonComponents.side_nav_items>
      </Graphene.CarbonComponents.side_nav>
    </Graphene.CarbonComponents.header>
    """
  end
end

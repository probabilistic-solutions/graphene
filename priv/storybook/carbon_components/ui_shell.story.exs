defmodule Storybook.CarbonComponents.UIShell do
  use PhoenixStorybook.Story, :example

  def doc do
    """
    UI shell layout.

    For full page layouts, wrap your main content inside a top-level `<Graphene.CarbonComponents.grid full_width>`
    so sections align to the Carbon grid and spacing is controlled via `row_gap`. When a
    side nav is present, the shell offsets content based on the nav expansion state so
    the layout matches Carbon UI shell guidance.
    """
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Graphene.CarbonComponents.ui_shell content_class="psb-ui-shell-content">
      <:skip_to_content>
        <a href="#main-content">Skip to content</a>
      </:skip_to_content>
      <:header>
        <Graphene.CarbonComponents.header aria-label="IBM Platform Name">
          <Graphene.CarbonComponents.header_menu_button
            button_label_active="Close menu"
            button_label_inactive="Open menu"
            collapse_mode="rail"
          />
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
            <Graphene.CarbonComponents.header_global_action
              button_label_inactive="Search"
              button_label_active="Search"
              tooltip_text="Search"
            >
              <:icon name="search" size={20} />
            </Graphene.CarbonComponents.header_global_action>
            <Graphene.CarbonComponents.header_global_action
              button_label_inactive="Notifications"
              button_label_active="Notifications"
              tooltip_text="Notifications"
            >
              <:icon name="notification" size={20} />
            </Graphene.CarbonComponents.header_global_action>
            <Graphene.CarbonComponents.header_global_action
              button_label_inactive="App Switcher"
              button_label_active="App Switcher"
              tooltip_text="App Switcher"
              tooltip_alignment="right"
            >
              <:icon name="switcher" size={20} />
            </Graphene.CarbonComponents.header_global_action>
          </:global>
        </Graphene.CarbonComponents.header>
      </:header>
      <:side_nav>
        <Graphene.CarbonComponents.side_nav aria-label="Side navigation" collapse_mode="rail">
          <Graphene.CarbonComponents.side_nav_items>
            <Graphene.CarbonComponents.side_nav_menu title="Category title">
              <:title_icon>
                <Graphene.CarbonComponents.icon name="analytics" size={16} />
              </:title_icon>
              <Graphene.CarbonComponents.side_nav_menu_item href="#">Link</Graphene.CarbonComponents.side_nav_menu_item>
              <Graphene.CarbonComponents.side_nav_menu_item href="#" active>Link</Graphene.CarbonComponents.side_nav_menu_item>
              <Graphene.CarbonComponents.side_nav_menu_item href="#">Link</Graphene.CarbonComponents.side_nav_menu_item>
            </Graphene.CarbonComponents.side_nav_menu>
            <Graphene.CarbonComponents.side_nav_menu title="Category title">
              <:title_icon>
                <Graphene.CarbonComponents.icon name="cloud-services" size={16} />
              </:title_icon>
              <Graphene.CarbonComponents.side_nav_menu_item href="#">Link</Graphene.CarbonComponents.side_nav_menu_item>
              <Graphene.CarbonComponents.side_nav_menu_item href="#">Link</Graphene.CarbonComponents.side_nav_menu_item>
              <Graphene.CarbonComponents.side_nav_menu_item href="#">Link</Graphene.CarbonComponents.side_nav_menu_item>
            </Graphene.CarbonComponents.side_nav_menu>
            <Graphene.CarbonComponents.side_nav_menu title="Category title">
              <:title_icon>
                <Graphene.CarbonComponents.icon name="security" size={16} />
              </:title_icon>
              <Graphene.CarbonComponents.side_nav_menu_item href="#">Link</Graphene.CarbonComponents.side_nav_menu_item>
              <Graphene.CarbonComponents.side_nav_menu_item href="#">Link</Graphene.CarbonComponents.side_nav_menu_item>
              <Graphene.CarbonComponents.side_nav_menu_item href="#">Link</Graphene.CarbonComponents.side_nav_menu_item>
            </Graphene.CarbonComponents.side_nav_menu>
            <Graphene.CarbonComponents.side_nav_link href="#">
              <:title_icon>
                <Graphene.CarbonComponents.icon name="catalog" size={16} />
              </:title_icon>
              Link
            </Graphene.CarbonComponents.side_nav_link>
            <Graphene.CarbonComponents.side_nav_link href="#">
              <:title_icon>
                <Graphene.CarbonComponents.icon name="settings" size={16} />
              </:title_icon>
              Link
            </Graphene.CarbonComponents.side_nav_link>
          </Graphene.CarbonComponents.side_nav_items>
        </Graphene.CarbonComponents.side_nav>
      </:side_nav>
      <:content>
        <div id="main-content" style="padding: 1rem;">
          <Graphene.CarbonComponents.button kind="secondary" href="/" size="sm">Return to storybook</Graphene.CarbonComponents.button>
          <div style="margin-top: 1rem;">
            Main content area
          </div>
        </div>
      </:content>
    </Graphene.CarbonComponents.ui_shell>
    """
  end
end

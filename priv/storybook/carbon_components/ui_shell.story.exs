defmodule Storybook.CarbonComponents.UIShell do
  use PhoenixStorybook.Story, :example

  import Graphene.CarbonComponents
  def doc do
    """
The UI shell is the persistent frame for product navigation, including header
and side nav. Use it to provide consistent navigation and branding.

Pair .ui_shell with a top-level .grid in the content area so sections align to
the Carbon grid.
"""
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.ui_shell content_class="psb-ui-shell-content">
      <:skip_to_content>
        <a href="#main-content">Skip to content</a>
      </:skip_to_content>
      <:header>
        <.header>
          <:name href="#">Graphene</:name>
          <.header_nav>
            <.header_nav_item href="#">Home</.header_nav_item>
            <.header_nav_item href="#">Docs</.header_nav_item>
          </.header_nav>
        </.header>
      </:header>
      <:side_nav>
        <.side_nav expanded={true}>
          <.side_nav_items>
            <.side_nav_link href="#">Dashboard</.side_nav_link>
            <.side_nav_link href="#">Settings</.side_nav_link>
          </.side_nav_items>
        </.side_nav>
      </:side_nav>
      <:content>
        <div id="main-content" style="padding: 1rem;">
          <.button kind="secondary" href="/" size="sm">Return to storybook</.button>
          <div style="margin-top: 1rem;">
            Main content area
          </div>
        </div>
      </:content>
    </.ui_shell>
    """
  end
end

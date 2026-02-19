defmodule Storybook.CarbonComponents.UIShell.Variants.HeaderBase do
  use PhoenixStorybook.Story, :example

  def doc do
    "Basic header with product name."
  end

  def render(assigns) do
    ~H"""
    <Graphene.CarbonComponents.header aria-label="IBM Platform Name">
      <Graphene.CarbonComponents.header_name href="#" prefix="IBM">[Platform]</Graphene.CarbonComponents.header_name>
    </Graphene.CarbonComponents.header>
    """
  end
end

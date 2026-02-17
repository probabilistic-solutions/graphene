defmodule Storybook.CarbonComponents.Link do
  use PhoenixStorybook.Story, :example

  def doc do
    "Link."
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div style="display: grid; gap: 0.75rem;">
      <Graphene.CarbonComponents.link href="#">Inline link</Graphene.CarbonComponents.link>
      <Graphene.CarbonComponents.link href="#" target="_blank" rel="noreferrer">External link</Graphene.CarbonComponents.link>
      <Graphene.CarbonComponents.link href="#" disabled>Disabled link</Graphene.CarbonComponents.link>
    </div>
    """
  end
end

defmodule Storybook.ProductComponents.CoachmarkTagline do
  use PhoenixStorybook.Story, :example

  alias Graphene.CarbonComponents, as: Carbon
  alias Graphene.ProductComponents, as: Product


  def doc do
    """
Coachmark tagline is a specialized onboarding element.
Use it only within guided onboarding experiences.
"""
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, open_tagline: false)}
  end

  @impl true
  def handle_event("open_tagline", _params, socket) do
    {:noreply, assign(socket, open_tagline: true)}
  end

  @impl true
  def handle_event("close_tagline", _params, socket) do
    {:noreply, assign(socket, open_tagline: false)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div style="display: grid; gap: 1rem;">
      <div style="display: flex; flex-wrap: wrap; gap: 0.75rem;">
        <Carbon.button kind="primary" phx-click="open_tagline">Open coachmark tagline</Carbon.button>
        <Carbon.button kind="ghost" phx-click="close_tagline">Close</Carbon.button>
      </div>

      <Product.coachmark_tagline
        open={@open_tagline}
        title="This is a tagline"
        close_icon_description="Close"
      />
    </div>
    """
  end
end

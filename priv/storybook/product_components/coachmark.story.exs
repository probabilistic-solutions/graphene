defmodule Storybook.ProductComponents.Coachmark do
  use PhoenixStorybook.Story, :example

  alias Graphene.CarbonComponents, as: Carbon
  alias Graphene.ProductComponents, as: Product


  def doc do
    """
Coachmarks guide users through key UI actions. Use the beacon trigger for
inline nudges, or a floating coachmark for movable walkthroughs.
"""
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, active_coachmark: nil)}
  end

  @impl true
  def handle_event("open_coachmark", %{"id" => id}, socket) do
    {:noreply, assign(socket, active_coachmark: id)}
  end

  @impl true
  def handle_event("close_coachmark", _params, socket) do
    {:noreply, assign(socket, active_coachmark: nil)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div style="display: grid; gap: 1rem;">
      <div style="display: flex; flex-wrap: wrap; gap: 0.75rem;">
        <Carbon.button kind="primary" phx-click="open_coachmark" phx-value-id="tooltip">
          Open tooltip coachmark
        </Carbon.button>
        <Carbon.button kind="secondary" phx-click="open_coachmark" phx-value-id="floating">
          Open floating coachmark
        </Carbon.button>
        <Carbon.button kind="ghost" phx-click="close_coachmark">Close</Carbon.button>
      </div>

      <Product.coachmark
        open={@active_coachmark == "tooltip"}
        align="bottom"
        high_contrast
      >
        <:trigger>
          <Product.coachmark_beacon id="coachmark-beacon-1" label="Show information" expanded />
        </:trigger>
        <Product.coachmark_header close_icon_description="Close" />
        <Product.coachmark_body>
          <h2>Hello world</h2>
          <p>This is a short description for the coachmark.</p>
          <Carbon.button size="sm" phx-click="close_coachmark">Done</Carbon.button>
        </Product.coachmark_body>
      </Product.coachmark>

      <Product.coachmark
        open={@active_coachmark == "floating"}
        align="bottom"
        high_contrast
        floating
      >
        <:trigger>
          <Carbon.button kind="tertiary">Show information</Carbon.button>
        </:trigger>
        <Product.coachmark_header close_icon_description="Close" drag_icon_description="Drag" />
        <Product.coachmark_body>
          <h2>Floating coachmark</h2>
          <p>Drag the coachmark to reposition it while exploring content.</p>
          <Carbon.button size="sm" phx-click="close_coachmark">Done</Carbon.button>
        </Product.coachmark_body>
      </Product.coachmark>
    </div>
    """
  end
end

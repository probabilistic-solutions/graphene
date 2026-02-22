defmodule Storybook.ProductComponents.AboutModal do
  use PhoenixStorybook.Story, :example

  alias Graphene.CarbonComponents, as: Carbon
  alias Graphene.ProductComponents, as: Product


  def doc do
    """
About modal summarizes product details, versions, and legal information.
Use it for product attribution, licensing notices, and quick version checks.
"""
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, open_modal: nil)}
  end

  @impl true
  def handle_event("open_modal", %{"id" => id}, socket) do
    {:noreply, assign(socket, open_modal: id)}
  end

  @impl true
  def handle_event("close_modal", _params, socket) do
    {:noreply, assign(socket, open_modal: nil)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div style="display: grid; gap: 1rem;">
      <div style="display: flex; flex-wrap: wrap; gap: 0.75rem;">
        <Carbon.button kind="primary" phx-click="open_modal" phx-value-id="default">
          Open default
        </Carbon.button>
        <Carbon.button kind="secondary" phx-click="open_modal" phx-value-id="all_props">
          Open with extra info
        </Carbon.button>
        <Carbon.button kind="ghost" phx-click="close_modal">Close</Carbon.button>
      </div>

      <Product.about_modal
        open={@open_modal == "default"}
        close_icon_description="Close"
        title="Graphene Analytics"
        version="Version 0.0.0"
        content="Cloud-native analytics and workflows for modern teams."
        copyright_text="Copyright © IBM Corp. 2020, 2026"
      />

      <Product.about_modal
        open={@open_modal == "all_props"}
        close_icon_description="Close"
        title="Graphene Enterprise Suite"
        version="Version 1.2.3"
        content="Enterprise-grade observability with advanced routing and policy tooling."
        additional_info="Powered by Carbon and IBM Products Web Components"
        logo="Graphene"
      />
    </div>
    """
  end
end

Code.require_file(Path.expand("../interactivity_helpers.exs", __DIR__))

defmodule Storybook.CarbonComponents.TreeView.Interactivity do
  use PhoenixStorybook.Story, :example

  import Graphene.CarbonComponents
  import Storybook.CarbonComponents.InteractivityHelpers

  def doc do
    "Tree view interactivity."
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, last_event: nil, value: nil, checked: nil)}
  end

  @impl true
  def render(assigns) do
    assigns =
      assign(
        assigns,
        :event_attrs,
        custom_event_attrs(["eventSelected", "eventToggled"], target_selector: "cds-tree-node")
      )

    ~H"""
    <.tree_view
      id="tree-view-events"
      label="Primary navigation"
      {@event_attrs}
    >
      <:node label="Products" is_expanded={true} id="products">
        <.tree_node label="Catalog" id="catalog" />
        <.tree_node label="Pricing" id="pricing" />
      </:node>
      <:node label="Teams" id="teams">
        <.tree_node label="Design" id="design" />
        <.tree_node label="Engineering" id="engineering" />
      </:node>
    </.tree_view>

    <.button kind="secondary" phx-click="standard_click">Standard event</.button>
    <.event_panel state={%{value: @value, checked: @checked}} last_event={@last_event} />
    """
  end

  @impl true
  def handle_event(event, payload, socket) do
    socket =
      socket
      |> assign_event(event, payload)
      |> assign_payload_state(payload)

    {:noreply, socket}
  end
end

Code.require_file(Path.expand("../interactivity_helpers.exs", __DIR__))

defmodule Storybook.CarbonComponents.Layer.Interactivity do
  use PhoenixStorybook.Story, :example

  import Graphene.CarbonComponents
  import Storybook.CarbonComponents.InteractivityHelpers

  def doc do
    "Layer interactivity."
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, last_event: nil, value: nil, checked: nil)}
  end

  @impl true
  def render(assigns) do
    assigns = assign(assigns, :event_attrs, custom_event_attrs(["cds-use-layer"]))

    ~H"""
    <.layer id="layer-events" {@event_attrs}>
      <div style="padding: 1rem; background: #f4f4f4;">Layer 0</div>
      <.layer>
        <div style="padding: 1rem; background: #e0e0e0;">Layer 1</div>
      </.layer>
    </.layer>

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

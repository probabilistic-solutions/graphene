Code.require_file(Path.expand("../interactivity_helpers.exs", __DIR__))

defmodule Storybook.CarbonComponents.FluidNumberInput.Interactivity do
  use PhoenixStorybook.Story, :example

  import Graphene.CarbonComponents
  import Storybook.CarbonComponents.InteractivityHelpers

  def doc do
    "Fluid number input interactivity."
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, last_event: nil, value: "5", checked: nil)}
  end

  @impl true
  def render(assigns) do
    assigns = assign(assigns, :event_attrs, custom_event_attrs(["cds-number-input", "invalid"]))

    ~H"""
    <.fluid_number_input
      id="fluid-number-input-events"
      label="Amount"
      value={@value}
      min="0"
      max="20"
      {@event_attrs}
    />

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

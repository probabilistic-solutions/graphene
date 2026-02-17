Code.require_file(Path.expand("../interactivity_helpers.exs", __DIR__))

defmodule Storybook.CarbonComponents.FluidTimePicker.Interactivity do
  use PhoenixStorybook.Story, :example

  import Graphene.CarbonComponents
  import Storybook.CarbonComponents.InteractivityHelpers

  def doc do
    "Fluid time picker interactivity."
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, last_event: nil, value: "12:00", checked: nil)}
  end

  @impl true
  def render(assigns) do
    assigns = assign(assigns, :event_attrs, custom_event_attrs(["change", "invalid"]))

    ~H"""
    <.fluid_time_picker
      id="fluid-time-picker-events"
      value={@value}
      {@event_attrs}
    >
      <:s-label-text>Start time</:s-label-text>
      <:select_item value="UTC" selected>UTC</:select_item>
      <:select_item value="PST">PST</:select_item>
    </.fluid_time_picker>

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

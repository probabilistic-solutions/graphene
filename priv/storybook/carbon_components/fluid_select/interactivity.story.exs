Code.require_file(Path.expand("../interactivity_helpers.exs", __DIR__))

defmodule Storybook.CarbonComponents.FluidSelect.Interactivity do
  use PhoenixStorybook.Story, :example

  import Graphene.CarbonComponents
  import Storybook.CarbonComponents.InteractivityHelpers

  def doc do
    "Fluid select interactivity."
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, last_event: nil, value: "option-1", checked: nil)}
  end

  @impl true
  def render(assigns) do
    assigns = assign(assigns, :event_attrs, custom_event_attrs(["cds-select-selected"]))

    ~H"""
    <.fluid_select
      id="fluid-select-events"
      label_text="Select an option"
      value={@value}
      {@event_attrs}
    >
      <:item value="">Choose one</:item>
      <:item value="option-1">Option 1</:item>
      <:item value="option-2">Option 2</:item>
    </.fluid_select>

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

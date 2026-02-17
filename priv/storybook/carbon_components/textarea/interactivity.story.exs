Code.require_file(Path.expand("../interactivity_helpers.exs", __DIR__))

defmodule Storybook.CarbonComponents.Textarea.Interactivity do
  use PhoenixStorybook.Story, :example

  import Graphene.CarbonComponents
  import Storybook.CarbonComponents.InteractivityHelpers

  def doc do
    "Textarea interactivity."
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, last_event: nil, value: "", checked: nil)}
  end

  @impl true
  def render(assigns) do
    assigns = assign(assigns, :event_attrs, custom_event_attrs(["input", "invalid"]))

    ~H"""
    <.textarea
      id="textarea-events"
      placeholder="Enter a message"
      required
      value={@value}
      {@event_attrs}
    >
      <:s-label-text>Message</:s-label-text>
    </.textarea>

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

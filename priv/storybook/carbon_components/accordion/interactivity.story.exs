Code.require_file(Path.expand("../interactivity_helpers.exs", __DIR__))

defmodule Storybook.CarbonComponents.Accordion.Interactivity do
  use PhoenixStorybook.Story, :example

  import Graphene.CarbonComponents
  import Storybook.CarbonComponents.InteractivityHelpers

  def doc do
    "Accordion interactivity."
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
        custom_event_attrs(
          ["cds-accordion-item-beingtoggled", "cds-accordion-item-toggled"],
          target_selector: "cds-accordion-item"
        )
      )

    ~H"""
    <.accordion
      id="accordion-events"
      {@event_attrs}
    >
      <:item title="Section 1" open>First section content.</:item>
      <:item title="Section 2">Second section content.</:item>
    </.accordion>

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

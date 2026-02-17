Code.require_file(Path.expand("../interactivity_helpers.exs", __DIR__))

defmodule Storybook.CarbonComponents.Tabs.Interactivity do
  use PhoenixStorybook.Story, :example

  import Graphene.CarbonComponents
  import Storybook.CarbonComponents.InteractivityHelpers

  def doc do
    "Tabs interactivity."
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
        custom_event_attrs(["cds-tabs-beingselected", "cds-tabs-selected"])
      )

    ~H"""
    <.tabs
      id="tabs-events"
      {@event_attrs}
    >
      <:tab target="tab-panel-1" title="First">First</:tab>
      <:tab target="tab-panel-2" title="Second">Second</:tab>
    </.tabs>
    <div id="tab-panel-1">First tab content.</div>
    <div id="tab-panel-2">Second tab content.</div>

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

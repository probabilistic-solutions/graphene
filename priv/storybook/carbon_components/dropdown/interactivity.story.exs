Code.require_file(Path.expand("../interactivity_helpers.exs", __DIR__))

defmodule Storybook.CarbonComponents.Dropdown.Interactivity do
  use PhoenixStorybook.Story, :example

  import Graphene.CarbonComponents
  import Storybook.CarbonComponents.InteractivityHelpers

  def doc do
    "Dropdown interactivity."
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, last_event: nil, value: "all", checked: nil)}
  end

  @impl true
  def render(assigns) do
    assigns =
      assign(
        assigns,
        :event_attrs,
        custom_event_attrs([
          "cds-dropdown-beingselected",
          "cds-dropdown-beingtoggled",
          "cds-dropdown-selected",
          "cds-dropdown-toggled",
          "input",
          "invalid"
        ])
      )

    ~H"""
    <.dropdown
      id="dropdown-events"
      title_text="Dropdown"
      value={@value}
      {@event_attrs}
    >
      <:item value="all">All</:item>
      <:item value="cloud">Cloud</:item>
      <:item value="edge">Edge</:item>
    </.dropdown>

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

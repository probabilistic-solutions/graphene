Code.require_file(Path.expand("../interactivity_helpers.exs", __DIR__))

defmodule Storybook.CarbonComponents.OverflowMenu.Interactivity do
  use PhoenixStorybook.Story, :example

  import Graphene.CarbonComponents
  import Storybook.CarbonComponents.InteractivityHelpers

  def doc do
    "Overflow menu interactivity."
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
        custom_event_attrs(["cds-overflow-menu-item-clicked"],
          target_selector: "cds-overflow-menu-item"
        )
      )

    ~H"""
    <.overflow_menu
      id="overflow-menu-events"
      {@event_attrs}
    >
      <:icon>
        <Graphene.Icons.icon fit="width" name="overflow-menu--horizontal" />
      </:icon>
      <:tooltip_content>Options</:tooltip_content>
      <:item>Action 1</:item>
      <:item>Action 2</:item>
      <:item danger>Delete</:item>
    </.overflow_menu>

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

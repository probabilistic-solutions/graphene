Code.require_file(Path.expand("../interactivity_helpers.exs", __DIR__))

defmodule Storybook.CarbonComponents.Notification.Actionable.Interactivity do
  use PhoenixStorybook.Story, :example

  import Graphene.CarbonComponents
  import Storybook.CarbonComponents.InteractivityHelpers

  def doc do
    "Actionable notification interactivity."
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, last_event: nil, value: nil, checked: nil, open: true)}
  end

  @impl true
  def render(assigns) do
    assigns =
      assign(
        assigns,
        :event_attrs,
        custom_event_attrs(["cds-notification-beingclosed", "cds-notification-closed"])
      )

    ~H"""
    <.button kind="ghost" phx-click="show-notification">
      Show notification
    </.button>

    <.actionable_notification
      id="actionable-notification-events"
      open={@open}
      action_button_label="Update"
      {@event_attrs}
    >
      <:title>Update available</:title>
      <:subtitle>A newer version is ready.</:subtitle>
      Additional details can go here.
    </.actionable_notification>
    <.event_panel
      state={%{open: @open, value: @value, checked: @checked}}
      last_event={@last_event}
    />
    """
  end

  @impl true
  def handle_event("show-notification", _params, socket) do
    {:noreply, assign(socket, :open, true)}
  end

  def handle_event(event, payload, socket) do
    socket =
      socket
      |> assign_event(event, payload)
      |> assign_payload_state(payload)
      |> maybe_close_notification(event)

    {:noreply, socket}
  end

  defp maybe_close_notification(socket, "cds-notification-closed"),
    do: assign(socket, :open, false)

  defp maybe_close_notification(socket, _event), do: socket
end

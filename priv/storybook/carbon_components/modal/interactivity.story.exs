Code.require_file(Path.expand("../interactivity_helpers.exs", __DIR__))

defmodule Storybook.CarbonComponents.Modal.Interactivity do
  use PhoenixStorybook.Story, :example

  import Graphene.CarbonComponents
  import Storybook.CarbonComponents.InteractivityHelpers

  def doc do
    "Modal interactivity."
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, last_event: nil, value: nil, checked: nil, open: false)}
  end

  @impl true
  def render(assigns) do
    assigns =
      assign(
        assigns,
        :event_attrs,
        custom_event_attrs(["cds-modal-beingclosed", "cds-modal-closed"])
      )

    ~H"""
    <.button kind="primary" phx-click="open-modal">
      Open modal
    </.button>

    <.modal
      id="modal-events"
      open={@open}
      heading="Modal heading"
      {@event_attrs}
    >
      <:body>Close the modal to see events.</:body>
      <:footer_button kind="secondary">Cancel</:footer_button>
      <:footer_button kind="primary">Submit</:footer_button>
    </.modal>
    <.event_panel
      state={%{open: @open, value: @value, checked: @checked}}
      last_event={@last_event}
    />
    """
  end

  @impl true
  def handle_event("open-modal", _params, socket) do
    {:noreply, assign(socket, :open, true)}
  end

  def handle_event(event, payload, socket) do
    socket =
      socket
      |> assign_event(event, payload)
      |> assign_payload_state(payload)
      |> maybe_close_modal(event)

    {:noreply, socket}
  end

  defp maybe_close_modal(socket, "cds-modal-closed"), do: assign(socket, :open, false)
  defp maybe_close_modal(socket, _event), do: socket
end

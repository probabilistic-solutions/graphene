Code.require_file(Path.expand("../interactivity_helpers.exs", __DIR__))

defmodule Storybook.CarbonComponents.FileUploader.Interactivity do
  use PhoenixStorybook.Story, :example

  import Graphene.CarbonComponents
  import Storybook.CarbonComponents.InteractivityHelpers

  def doc do
    "File uploader interactivity."
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
          [
            "cds-file-uploader-button-changed",
            "cds-file-uploader-item-beingdeleted",
            "cds-file-uploader-item-deleted"
          ],
          target_selector: "cds-file-uploader-button, cds-file-uploader-item"
        )
      )

    ~H"""
    <.file_uploader
      id="file-uploader-events"
      label_title="Upload files"
      label_description="Max file size 500mb"
      {@event_attrs}
    >
      <:button>Upload</:button>
      <:item state="complete">report.pdf</:item>
    </.file_uploader>

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

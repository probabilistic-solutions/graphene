Code.require_file(Path.expand("../interactivity_helpers.exs", __DIR__))

defmodule Storybook.CarbonComponents.ComboBox.Interactivity do
  use PhoenixStorybook.Story, :example

  import Graphene.CarbonComponents
  import Storybook.CarbonComponents.InteractivityHelpers

  def doc do
    "Combo box interactivity."
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
          "cds-combo-box-beingselected",
          "cds-combo-box-beingtoggled",
          "cds-combo-box-selected",
          "cds-combo-box-toggled",
          "input",
          "invalid"
        ])
      )

    ~H"""
    <.combo_box
      id="combo-box-events"
      title_text="Choose an option"
      label="Combo box"
      value={@value}
      {@event_attrs}
    >
      <:item value="all">All</:item>
      <:item value="cloud">Cloud</:item>
      <:item value="edge">Edge</:item>
    </.combo_box>

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

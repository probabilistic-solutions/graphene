Code.require_file(Path.expand("../interactivity_helpers.exs", __DIR__))

defmodule Storybook.CarbonComponents.MultiSelect.Interactivity do
  use PhoenixStorybook.Story, :example

  import Graphene.CarbonComponents
  import Storybook.CarbonComponents.InteractivityHelpers

  def doc do
    "Multi select interactivity."
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
        custom_event_attrs([
          "cds-multi-select-beingselected",
          "cds-multi-select-selected",
          "cds-multi-select-beingtoggled",
          "cds-multi-select-toggled",
          "input",
          "invalid"
        ])
      )

    ~H"""
    <.multi_select
      id="multi-select-events"
      name="multi-select-events"
      title_text="Choose multiple"
      {@event_attrs}
    >
      <:item value="one">Option 1</:item>
      <:item value="two">Option 2</:item>
      <:item value="three">Option 3</:item>
    </.multi_select>

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

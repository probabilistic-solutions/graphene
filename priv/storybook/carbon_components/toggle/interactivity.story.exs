Code.require_file(Path.expand("../interactivity_helpers.exs", __DIR__))

defmodule Storybook.CarbonComponents.Toggle.Interactivity do
  use PhoenixStorybook.Story, :example

  import Graphene.CarbonComponents
  import Storybook.CarbonComponents.InteractivityHelpers

  def doc do
    "Toggle interactivity."
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, last_event: nil, value: nil, checked: false)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <form id="toggle-form" phx-change="toggle_changed">
      <label class="inline-flex items-center gap-3 cursor-pointer">
        <.toggle type="checkbox" id="toggle-events" label_text="Enable feature" name="checked" value="true" checked={@checked} />
      </label>
    </form>
    <div class="mt-4 p-4 bg-gray-100 rounded">
      <p>Toggle state:</p>
      <ul class="mt-2">
        <li>Value: {@value}</li>
        <li>Checked: {@checked}</li>
        <li>Last event: {inspect(@last_event)}</li>
      </ul>
    </div>
    """
  end

  @impl true
  def handle_event("toggle_changed", payload, socket) do
    checked =
      case Map.get(payload, "checked") do
        "true" -> true
        "on" -> true
        true -> true
        _ -> false
      end

    socket =
      socket
      |> assign_event("toggle_changed", payload)
      |> assign(:checked, checked)
      |> assign(:value, if(checked, do: "true", else: "false"))

    {:noreply, socket}
  end

  def handle_event(event, payload, socket) do
    socket =
      socket
      |> assign_event(event, payload)
      |> assign_payload_state(payload)

    {:noreply, socket}
  end
end

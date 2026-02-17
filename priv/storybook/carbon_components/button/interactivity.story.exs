defmodule Storybook.CarbonComponents.Button.Interactivity do
  use PhoenixStorybook.Story, :example

  import Graphene.CarbonComponents
  import Storybook.CarbonComponents.InteractivityHelpers
  alias Phoenix.LiveView.JS

  def doc do
    "Button interactivity."
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, last_event: nil, value: nil, checked: nil, click_count: 0, detail: nil)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.button phx-click="increment_click">Standard click</.button>
      <.button
        kind="secondary"
        phx-click={JS.push("handle_custom", value: %{detail: "custom_event_data"})}
      >
        JS.push click
      </.button>

      <%= if @click_count > 0 do %>
        <div class="mt-4">
          <%= for _ <- 1..@click_count do %>
            <div>button clicked</div>
          <% end %>
        </div>
      <% end %>

      <%= if @detail do %>
        <div class="mt-4 p-3 bg-gray-100 rounded">
          <strong>Detail:</strong> {@detail}
        </div>
      <% end %>
    </div>
    """
  end

  @impl true
  def handle_event("increment_click", _payload, socket) do
    {:noreply, update(socket, :click_count, &(&1 + 1))}
  end

  def handle_event("handle_custom", payload, socket) do
    socket =
      socket
      |> assign_event("handle_custom", payload)
      |> assign_payload_state(payload)
      |> update(:click_count, &(&1 + 1))
      |> assign(:detail, payload["detail"])

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

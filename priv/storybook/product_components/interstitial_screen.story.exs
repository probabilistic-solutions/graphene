defmodule Storybook.ProductComponents.InterstitialScreen do
  use PhoenixStorybook.Story, :example

  alias Graphene.CarbonComponents, as: Carbon
  alias Graphene.ProductComponents, as: Product

  def doc do
    """
    Interstitial screens provide guided, multi-step onboarding in a modal or
    full-screen experience. Use the body items for step content and the footer
    for navigation actions.
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, active_screen: nil, event_log: [])}
  end

  @impl true
  def handle_event("open_screen", %{"id" => id}, socket) do
    {:noreply, assign(socket, active_screen: id)}
  end

  @impl true
  def handle_event("close_screen", _params, socket) do
    {:noreply, assign(socket, active_screen: nil)}
  end

  @impl true
  def handle_event("interstitial:event", payload, socket) do
    socket = log_event(socket, payload)

    socket =
      if payload["event"] == "c4p-interstitial-closed" do
        assign(socket, active_screen: nil)
      else
        socket
      end

    {:noreply, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div style="display: grid; gap: 1rem;">
      <div style="display: flex; flex-wrap: wrap; gap: 0.75rem;">
        <Carbon.button kind="primary" phx-click="open_screen" phx-value-id="modal">
          Open modal
        </Carbon.button>
        <Carbon.button kind="secondary" phx-click="open_screen" phx-value-id="modal_multi_step">
          Open modal (multi-step)
        </Carbon.button>
        <Carbon.button kind="secondary" phx-click="open_screen" phx-value-id="modal_async_action">
          Open modal (async action)
        </Carbon.button>
        <Carbon.button kind="secondary" phx-click="open_screen" phx-value-id="custom_actions">
          Open modal (custom actions)
        </Carbon.button>
        <Carbon.button kind="secondary" phx-click="open_screen" phx-value-id="full_screen">
          Open full screen
        </Carbon.button>
        <Carbon.button kind="secondary" phx-click="open_screen" phx-value-id="full_screen_multi_step">
          Open full screen (multi-step)
        </Carbon.button>
        <Carbon.button kind="ghost" phx-click="close_screen">Close</Carbon.button>
      </div>

      <Product.interstitial_screen open={@active_screen == "modal"}>
        <:header>
          <Product.interstitial_screen_header
            header_title="Use case-specific title"
            header_subtitle="Use case-specific subtitle"
          />
        </:header>
        <:body>
          <Product.interstitial_screen_body>
            <Product.interstitial_screen_body_item step_title="Step 1">
              <p>Connect a data source to begin ingestion.</p>
            </Product.interstitial_screen_body_item>
          </Product.interstitial_screen_body>
        </:body>
        <:footer>
          <Product.interstitial_screen_footer />
        </:footer>
      </Product.interstitial_screen>

      <Product.interstitial_screen open={@active_screen == "modal_multi_step"}>
        <:header>
          <Product.interstitial_screen_header
            header_title="Use case-specific title"
            header_subtitle="Use case-specific subtitle"
          />
        </:header>
        <:body>
          <Product.interstitial_screen_body>
            <Product.interstitial_screen_body_item step_title="Step 1">
              <p>Connect a data source.</p>
            </Product.interstitial_screen_body_item>
            <Product.interstitial_screen_body_item step_title="Step 2">
              <p>Assign access controls for your team.</p>
            </Product.interstitial_screen_body_item>
            <Product.interstitial_screen_body_item step_title="Step 3">
              <p>Review and start monitoring.</p>
            </Product.interstitial_screen_body_item>
          </Product.interstitial_screen_body>
        </:body>
        <:footer>
          <Product.interstitial_screen_footer />
        </:footer>
      </Product.interstitial_screen>

      <Product.interstitial_screen open={@active_screen == "modal_async_action"}>
        <:header>
          <Product.interstitial_screen_header
            header_title="Use case-specific title"
            header_subtitle="Use case-specific subtitle"
          />
        </:header>
        <:body>
          <Product.interstitial_screen_body>
            <Product.interstitial_screen_body_item step_title="Step 1">
              <p>Connect a data source.</p>
            </Product.interstitial_screen_body_item>
            <Product.interstitial_screen_body_item step_title="Step 2">
              <p>Assign access controls for your team.</p>
            </Product.interstitial_screen_body_item>
          </Product.interstitial_screen_body>
        </:body>
        <:footer>
          <Product.interstitial_screen_footer async_action={true} />
        </:footer>
      </Product.interstitial_screen>

      <Product.interstitial_screen open={@active_screen == "custom_actions"}>
        <:header>
          <Product.interstitial_screen_header
            header_title="Use case-specific title"
            header_subtitle="Use case-specific subtitle"
          />
        </:header>
        <:body>
          <Product.interstitial_screen_body>
            <Product.interstitial_screen_body_item step_title="Step 1">
              <p>Connect a data source.</p>
            </Product.interstitial_screen_body_item>
            <Product.interstitial_screen_body_item step_title="Step 2">
              <p>Assign access controls for your team.</p>
            </Product.interstitial_screen_body_item>
            <Product.interstitial_screen_body_item step_title="Step 3">
              <p>Review and launch.</p>
            </Product.interstitial_screen_body_item>
          </Product.interstitial_screen_body>
        </:body>
        <:footer>
          <div style="display: flex; justify-content: space-between; gap: 1rem;">
            <Carbon.button kind="ghost" phx-click="close_screen">Skip</Carbon.button>
            <div style="display: flex; gap: 0.5rem;">
              <Carbon.button kind="secondary">Back</Carbon.button>
              <Carbon.button kind="primary">Next</Carbon.button>
            </div>
          </div>
        </:footer>
      </Product.interstitial_screen>

      <Product.interstitial_screen open={@active_screen == "full_screen"} fullscreen>
        <:header>
          <Product.interstitial_screen_header
            header_title="Use case-specific title"
            header_subtitle="Use case-specific subtitle"
          />
        </:header>
        <:body>
          <Product.interstitial_screen_body>
            <Product.interstitial_screen_body_item step_title="Step 1">
              <p>Connect a data source to begin ingestion.</p>
            </Product.interstitial_screen_body_item>
          </Product.interstitial_screen_body>
        </:body>
        <:footer>
          <Product.interstitial_screen_footer />
        </:footer>
      </Product.interstitial_screen>

      <Product.interstitial_screen
        id="interstitial-full-screen"
        open={@active_screen == "full_screen_multi_step"}
        fullscreen
        events={interstitial_events("full_screen_multi_step")}
      >
        <:header>
          <Product.interstitial_screen_header
            header_title="Use case-specific title"
            header_subtitle="Use case-specific subtitle"
          />
        </:header>
        <:body>
          <Product.interstitial_screen_body>
            <Product.interstitial_screen_body_item step_title="Step 1">
              <p>Connect a data source.</p>
            </Product.interstitial_screen_body_item>
            <Product.interstitial_screen_body_item step_title="Step 2">
              <p>Assign access controls for your team.</p>
            </Product.interstitial_screen_body_item>
            <Product.interstitial_screen_body_item step_title="Step 3">
              <p>Review and launch.</p>
            </Product.interstitial_screen_body_item>
          </Product.interstitial_screen_body>
        </:body>
        <:footer>
          <Product.interstitial_screen_footer />
        </:footer>
      </Product.interstitial_screen>

      <.event_log logs={@event_log} />
    </div>
    """
  end

  defp interstitial_events(variant) do
    [
      {"c4p-interstitial-opened",
       [
         push: "interstitial:event",
         payload: event_payload("c4p-interstitial-opened", %{variant: variant})
       ]},
      {"c4p-interstitial-beingclosed",
       [
         push: "interstitial:event",
         payload: event_payload("c4p-interstitial-beingclosed", %{variant: variant})
       ]},
      {"c4p-interstitial-closed",
       [
         push: "interstitial:event",
         payload: event_payload("c4p-interstitial-closed", %{variant: variant})
       ]}
    ]
  end

  defp event_payload(event, extra \\ %{}) do
    %{merge: [:detail, :target], static: Map.merge(%{event: event}, extra)}
  end

  defp log_event(socket, payload) do
    update(socket, :event_log, fn logs ->
      [%{event: payload["event"] || "event", payload: payload} | Enum.take(logs, 19)]
    end)
  end

  attr :logs, :list, default: []

  defp event_log(assigns) do
    ~H"""
    <div>
      <h4>Event payloads</h4>
      <pre>
    <%= for log <- Enum.reverse(@logs) do %>
    [<%= log.event %>] <%= Jason.encode!(log.payload) %>
    <% end %>
      </pre>
    </div>
    """
  end
end

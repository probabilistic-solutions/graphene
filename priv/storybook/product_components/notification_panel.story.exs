defmodule Storybook.ProductComponents.NotificationPanel do
  use PhoenixStorybook.Story, :example

  alias Graphene.CarbonComponents, as: Carbon
  alias Graphene.ProductComponents, as: Product


  def doc do
    """
Notification panels group recent alerts and actions into Today/Previous sections.
Use notification items with titles and descriptions, and provide a footer action.
"""
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, active_panel: nil)}
  end

  @impl true
  def handle_event("open_panel", %{"id" => id}, socket) do
    {:noreply, assign(socket, active_panel: id)}
  end

  @impl true
  def handle_event("close_panel", _params, socket) do
    {:noreply, assign(socket, active_panel: nil)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div style="display: grid; gap: 1rem;">
      <div style="display: flex; flex-wrap: wrap; gap: 0.75rem;">
        <Carbon.button kind="primary" phx-click="open_panel" phx-value-id="default">
          Open notifications
        </Carbon.button>
        <Carbon.button kind="secondary" phx-click="open_panel" phx-value-id="empty_state">
          Open empty state
        </Carbon.button>
        <Carbon.button kind="ghost" phx-click="close_panel">Close</Carbon.button>
      </div>

      <Product.notification_panel
        open={@active_panel == "default"}
        title_text="Notifications"
        today_text="Today"
        previous_text="Earlier"
        dismiss_all_label="Dismiss all"
        donot_disturb_label="Do not disturb"
        empty_state_label="You are all caught up"
      >
        <:today>
          <Product.notification type="informational" timestamp="2m ago">
            <:title>Build completed</:title>
            <:description>The nightly data ingest finished successfully.</:description>
          </Product.notification>
          <Product.notification type="warning" timestamp="12m ago">
            <:title>Storage nearing limit</:title>
            <:description>Increase your storage quota or archive old runs.</:description>
          </Product.notification>
        </:today>
        <:previous>
          <Product.notification type="success" timestamp="Yesterday">
            <:title>Access granted</:title>
            <:description>New access policy applied to the analytics workspace.</:description>
          </Product.notification>
        </:previous>
        <:footer>
          <div style="display: flex; justify-content: space-between; align-items: center; gap: 0.75rem;">
            <Product.notification_footer view_all_label="View all (3)" />
            <Carbon.button size="sm" kind="ghost" phx-click="close_panel">Close</Carbon.button>
          </div>
        </:footer>
      </Product.notification_panel>

      <Product.notification_panel
        open={@active_panel == "empty_state"}
        title_text="Notifications"
        empty_state_label="You are all caught up"
      >
        <:empty_state>
          <div style="display: grid; gap: 0.5rem;">
            <strong>No notifications</strong>
            <span>You're all caught up. We'll let you know if anything changes.</span>
            <Carbon.button size="sm" kind="ghost" phx-click="close_panel">Close</Carbon.button>
          </div>
        </:empty_state>
      </Product.notification_panel>
    </div>
    """
  end
end

defmodule DemoWeb.ActivityLive do
  use DemoWeb, :live_view

  alias Demo.CloudData
  alias Demo.CloudEvents

  import DemoWeb.CloudHelpers

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket) do
      CloudEvents.subscribe()
    end

    {:ok,
     assign(socket,
       active_page: :activity,
       page_title: "Live Activity · Nimbus Cloud",
       events: CloudData.activity_seed()
     )}
  end

  @impl true
  def handle_event("emit_event", _params, socket) do
    event = %{
      id: "evt-#{System.unique_integer([:positive])}",
      time: DateTime.utc_now() |> Calendar.strftime("%H:%M"),
      service: "Automation",
      event: "Synthetic health check passed",
      severity: "Info",
      status: "Healthy"
    }

    CloudEvents.broadcast(event)
    {:noreply, put_flash(socket, :info, "Synthetic event broadcast to all operators.")}
  end

  @impl true
  def handle_info({:cloud_event, event}, socket) do
    events = [event | socket.assigns.events] |> Enum.take(15)
    {:noreply, assign(socket, :events, events)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.page_header>
      <:breadcrumb>
        <.breadcrumb size="sm">
          <:item href={~p"/demo"} text="Cloud Admin" />
        </.breadcrumb>
      </:breadcrumb>
      <:content title="Live Activity">
        <.tag type="blue">PubSub</.tag>
      </:content>
      <:content_text subtitle="Streaming operational events in real-time across the control plane." />
    </.page_header>

    <.grid>
      <:column span="16">
        <div class="demo-section demo-card">
          <.button kind="primary" phx-click="emit_event">
            Send synthetic event
          </.button>
        </div>
      </:column>

      <:column span="16">
        <div class="demo-section demo-card demo-card--elevated">
          <.table_live id="activity-feed" rows={@events} size="sm">
            <:col :let={event} label="Time">{event.time}</:col>
            <:col :let={event} label="Service">{event.service}</:col>
            <:col :let={event} label="Event">{event.event}</:col>
            <:col :let={event} label="Severity">
              <.tag type={severity_kind(event.severity)}>
                {event.severity}
              </.tag>
            </:col>
            <:col :let={event} label="Status">
              <.tag type={status_kind(event.status)}>
                {event.status}
              </.tag>
            </:col>
          </.table_live>
        </div>
      </:column>
    </.grid>
    """
  end
end

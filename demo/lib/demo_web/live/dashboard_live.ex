defmodule DemoWeb.DashboardLive do
  use DemoWeb, :live_view

  alias Demo.CloudData
  alias Demo.CloudEvents

  import DemoWeb.CloudHelpers

  @impl true
  def mount(_params, _session, socket) do
    metrics = CloudData.summary_metrics()

    {:ok,
     assign(socket,
       active_page: :overview,
       page_title: "Overview · Nimbus Cloud",
       metrics: metrics,
       services: CloudData.services(),
       audits: CloudData.audit_events(),
       time_range: "24h",
       risk_acknowledged: false,
       range_form: to_form(%{"range" => "24h"}, as: :range)
     )}
  end

  @impl true
  def handle_event("switch_range", %{"range" => %{"range" => range}}, socket) do
    {:noreply,
     socket
     |> assign(:time_range, range)
     |> assign(:range_form, to_form(%{"range" => range}, as: :range))
     |> put_flash(:info, "Switched metrics to #{range} window")}
  end

  def handle_event("acknowledge_risk", _params, socket) do
    CloudEvents.broadcast(%{
      id: "evt-#{System.unique_integer([:positive])}",
      time: current_time(),
      service: "Security",
      event: "Risk register acknowledged",
      severity: "Info",
      status: "Applied"
    })

    {:noreply,
     socket
     |> assign(:risk_acknowledged, true)
     |> put_flash(:info, "Risk register acknowledged and audit log updated.")}
  end

  def handle_event("create_snapshot", _params, socket) do
    CloudEvents.broadcast(%{
      id: "evt-#{System.unique_integer([:positive])}",
      time: current_time(),
      service: "Storage",
      event: "Snapshot requested for Aurora",
      severity: "Low",
      status: "Queued"
    })

    {:noreply, put_flash(socket, :info, "Snapshot request queued for Aurora cluster.")}
  end

  defp current_time do
    DateTime.utc_now() |> Calendar.strftime("%H:%M")
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
      <:content title="Overview">
        <.tag type="green">Production</.tag>
      </:content>
      <:content_text subtitle="Real-time health, spend, and security posture across Nimbus Cloud." />
    </.page_header>

    <.grid full_width row_gap="07">
      <:column span="16">
        <.tile>
          <.form for={@range_form} phx-change="switch_range">
            <.radio_button_group
              field={@range_form[:range]}
              legend_text="Metrics window"
              name="metrics-window"
            >
              <:item label="Last 24h" value="24h" />
              <:item label="7 days" value="7d" />
              <:item label="30 days" value="30d" />
            </.radio_button_group>
          </.form>
        </.tile>
      </:column>

      <:column span="16">
        <.grid>
          <:column sm="4" md="2" lg="4">
            <.tile>
              <.stack gap="2">
                <p>Active clusters</p>
                <h3>{@metrics.clusters}</h3>
                <p>+2 provisioned this quarter</p>
              </.stack>
            </.tile>
          </:column>
          <:column sm="4" md="2" lg="4">
            <.tile>
              <.stack gap="2">
                <p>Monthly spend</p>
                <h3>{format_money(@metrics.monthly_spend)}</h3>
                <.progress_bar value={@metrics.monthly_spend / @metrics.budget * 100} />
                <p>Budget {format_money(@metrics.budget)}</p>
              </.stack>
            </.tile>
          </:column>
          <:column sm="4" md="2" lg="4">
            <.tile>
              <.stack gap="2">
                <p>Security posture</p>
                <h3>{@metrics.risk_score}%</h3>
                <p>Aligned with CIS controls</p>
                <.button kind="ghost" size="sm" phx-click="acknowledge_risk">
                  {if @risk_acknowledged, do: "Acknowledged", else: "Acknowledge"}
                </.button>
              </.stack>
            </.tile>
          </:column>
          <:column sm="4" md="2" lg="4">
            <.tile>
              <.stack gap="2">
                <p>SLA uptime</p>
                <h3>{format_percent(@metrics.uptime)}</h3>
                <p>All regions within target</p>
                <.button kind="ghost" size="sm" phx-click="create_snapshot">
                  Create snapshot
                </.button>
              </.stack>
            </.tile>
          </:column>
          <:column sm="4" md="2" lg="4">
            <.tile>
              <.stack gap="2">
                <p>Regions online</p>
                <h3>12</h3>
                <p>3 failover ready</p>
              </.stack>
            </.tile>
          </:column>
          <:column sm="4" md="2" lg="4">
            <.tile>
              <.stack gap="2">
                <p>Edge PoPs</p>
                <h3>214</h3>
                <p>+12 this quarter</p>
              </.stack>
            </.tile>
          </:column>
          <:column sm="4" md="2" lg="4">
            <.tile>
              <.stack gap="2">
                <p>Latency p95</p>
                <h3>28 ms</h3>
                <p>SLO target 50 ms</p>
              </.stack>
            </.tile>
          </:column>
          <:column sm="4" md="2" lg="4">
            <.tile>
              <.stack gap="2">
                <p>Security posture</p>
                <h3>96%</h3>
                <p>CIS aligned</p>
              </.stack>
            </.tile>
          </:column>
          <:column sm="4" md="4" lg="8">
            <.tile>
              <.stack gap="2">
                <.stack orientation="horizontal" gap="2">
                  <p>Storage IOPS</p>
                  <.tag type="green">Stable</.tag>
                </.stack>
                <h3>84k</h3>
                <.progress_bar value={72} />
                <p>72% of provisioned capacity</p>
              </.stack>
            </.tile>
          </:column>
          <:column sm="4" md="4" lg="8">
            <.tile>
              <.stack gap="2">
                <.stack orientation="horizontal" gap="2">
                  <p>Outbound traffic</p>
                  <.tag type="blue">Trending up</.tag>
                </.stack>
                <h3>3.2 Tbps</h3>
                <.progress_bar value={64} />
                <p>Peaked 20 minutes ago</p>
              </.stack>
            </.tile>
          </:column>
          <:column span="16">
            <.contained_list>
              <:label>Runbook queue</:label>
              <:action>
                <.tag type="blue">3 active</.tag>
              </:action>
              <.contained_list_item>
                Failover rehearsal · us-east-1
                <:action>ETA 12m</:action>
              </.contained_list_item>
              <.contained_list_item>
                Edge cache warmup · LON
                <:action>ETA 18m</:action>
              </.contained_list_item>
              <.contained_list_item>
                Snapshot verify · Aurora
                <:action>ETA 22m</:action>
              </.contained_list_item>
            </.contained_list>
          </:column>
        </.grid>
      </:column>

      <:column span="16">
        <.grid>
          <:column sm="4" md="4" lg="8">
            <.data_table id="service-health" rows={@services} row_id={& &1.name} size="sm">
              <:title>Service health</:title>
              <:col :let={service} label="Service">{service.name}</:col>
              <:col :let={service} label="Status">
                <.tag type={status_kind(service.status)}>
                  {service.status}
                </.tag>
              </:col>
              <:col :let={service} label="Latency">{service.latency_ms} ms</:col>
              <:col :let={service} label="SLA">{format_percent(service.sla)}</:col>
            </.data_table>
          </:column>
          <:column sm="4" md="4" lg="8">
            <.data_table id="recent-audits" rows={@audits} row_id={& &1.id} size="sm">
              <:title>Recent audit activity</:title>
              <:col :let={audit} label="Time">{audit.time}</:col>
              <:col :let={audit} label="Actor">{audit.actor}</:col>
              <:col :let={audit} label="Action">{audit.action}</:col>
            </.data_table>
          </:column>
        </.grid>
      </:column>
    </.grid>
    """
  end
end

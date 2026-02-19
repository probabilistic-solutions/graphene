defmodule DemoWeb.DashboardLive do
  use DemoWeb, :live_view

  alias Demo.CloudData
  alias Demo.CloudEvents

  alias Graphene.Icons
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
    <.grid full_width>
      <:column span="16">
        <.page_header>
          <:breadcrumb>
            <.breadcrumb>
              <:item href={~p"/demo"} text="Cloud Admin" />
              <:item text="Overview" />
            </.breadcrumb>
          </:breadcrumb>
          <:content title="Overview">
            <.tag type="green">Production</.tag>
          </:content>
          <:content_text subtitle="Real-time health, spend, and security posture across Nimbus Cloud." />
        </.page_header>
      </:column>

      <:column span="16">
        <div class="demo-section demo-card">
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
        </div>
      </:column>

      <:column span="16">
        <.grid full_width class="demo-section">
          <:column sm="4" md="2" lg="4">
            <.tile class="demo-card demo-metric">
              <div class="demo-kicker">Active clusters</div>
              <h3>{@metrics.clusters}</h3>
              <p class="demo-muted">+2 provisioned this quarter</p>
            </.tile>
          </:column>
          <:column sm="4" md="2" lg="4">
            <.tile class="demo-card demo-metric">
              <div class="demo-kicker">Monthly spend</div>
              <h3>{format_money(@metrics.monthly_spend)}</h3>
              <.progress_bar value={@metrics.monthly_spend / @metrics.budget * 100} />
              <p class="demo-muted">Budget {format_money(@metrics.budget)}</p>
            </.tile>
          </:column>
          <:column sm="4" md="2" lg="4">
            <.tile class="demo-card demo-metric">
              <div class="demo-kicker">Security posture</div>
              <h3>{@metrics.risk_score}%</h3>
              <p class="demo-muted">Aligned with CIS controls</p>
              <.button kind="ghost" size="sm" phx-click="acknowledge_risk">
                {if @risk_acknowledged, do: "Acknowledged", else: "Acknowledge"}
              </.button>
            </.tile>
          </:column>
          <:column sm="4" md="2" lg="4">
            <.tile class="demo-card demo-metric">
              <div class="demo-kicker">SLA uptime</div>
              <h3>{format_percent(@metrics.uptime)}</h3>
              <p class="demo-muted">All regions within target</p>
              <.button kind="ghost" size="sm" phx-click="create_snapshot">
                Create snapshot
              </.button>
            </.tile>
          </:column>
        </.grid>
      </:column>

      <:column span="16">
        <div class="demo-section demo-card">
          <div class="demo-kicker">Layout</div>
          <h3>Implicit grid rows</h3>
          <p class="demo-muted">Columns wrap when the total span exceeds 16.</p>
          <.grid class="demo-grid-example">
            <:column span="4">
              <div class="demo-grid-widget">
                <div class="demo-grid-widget__header">
                  <Icons.icon name="cloud" size={16} />
                  <span class="demo-grid-widget__title">Regions online</span>
                </div>
                <div class="demo-grid-widget__value">12</div>
                <div class="demo-grid-widget__meta">3 failover ready</div>
              </div>
            </:column>
            <:column span="4">
              <div class="demo-grid-widget">
                <div class="demo-grid-widget__header">
                  <Icons.icon name="cloud-services" size={16} />
                  <span class="demo-grid-widget__title">Edge PoPs</span>
                </div>
                <div class="demo-grid-widget__value">214</div>
                <div class="demo-grid-widget__meta">+12 this quarter</div>
              </div>
            </:column>
            <:column span="4">
              <div class="demo-grid-widget">
                <div class="demo-grid-widget__header">
                  <Icons.icon name="dashboard" size={16} />
                  <span class="demo-grid-widget__title">Latency p95</span>
                </div>
                <div class="demo-grid-widget__value">28 ms</div>
                <div class="demo-grid-widget__meta">SLO target 50 ms</div>
              </div>
            </:column>
            <:column span="4">
              <div class="demo-grid-widget">
                <div class="demo-grid-widget__header">
                  <Icons.icon name="security" size={16} />
                  <span class="demo-grid-widget__title">Security posture</span>
                </div>
                <div class="demo-grid-widget__value">96%</div>
                <div class="demo-grid-widget__meta">CIS aligned</div>
              </div>
            </:column>
            <:column span="8">
              <div class="demo-grid-widget demo-grid-widget--wide">
                <div class="demo-grid-widget__header">
                  <Icons.icon name="cloud-services" size={16} />
                  <span class="demo-grid-widget__title">Storage IOPS</span>
                  <span class="demo-grid-widget__tag">
                    <.tag type="green">Stable</.tag>
                  </span>
                </div>
                <div class="demo-grid-widget__value">84k</div>
                <.progress_bar value={72} />
                <div class="demo-grid-widget__meta">72% of provisioned capacity</div>
              </div>
            </:column>
            <:column span="8">
              <div class="demo-grid-widget demo-grid-widget--wide">
                <div class="demo-grid-widget__header">
                  <Icons.icon name="dashboard" size={16} />
                  <span class="demo-grid-widget__title">Outbound traffic</span>
                  <span class="demo-grid-widget__tag">
                    <.tag type="blue">Trending up</.tag>
                  </span>
                </div>
                <div class="demo-grid-widget__value">3.2 Tbps</div>
                <.progress_bar value={64} />
                <div class="demo-grid-widget__meta">Peaked 20 minutes ago</div>
              </div>
            </:column>
            <:column span="16">
              <div class="demo-grid-widget demo-grid-widget--wide">
                <div class="demo-grid-widget__header">
                  <Icons.icon name="notification" size={16} />
                  <span class="demo-grid-widget__title">Runbook queue</span>
                  <span class="demo-grid-widget__tag">
                    <.tag type="blue">3 active</.tag>
                  </span>
                </div>
                <div class="demo-grid-widget__list">
                  <div class="demo-grid-widget__list-row">
                    <span>Failover rehearsal · us-east-1</span>
                    <span class="demo-grid-widget__meta">ETA 12m</span>
                  </div>
                  <div class="demo-grid-widget__list-row">
                    <span>Edge cache warmup · LON</span>
                    <span class="demo-grid-widget__meta">ETA 18m</span>
                  </div>
                  <div class="demo-grid-widget__list-row">
                    <span>Snapshot verify · Aurora</span>
                    <span class="demo-grid-widget__meta">ETA 22m</span>
                  </div>
                </div>
              </div>
            </:column>
          </.grid>
        </div>
      </:column>

      <:column span="16">
        <.grid full_width class="demo-section">
          <:column sm="4" md="4" lg="8">
            <.tile class="demo-card demo-card--elevated">
              <h3>Service health</h3>
              <.table_live id="service-health" rows={@services} size="sm">
                <:col :let={service} label="Service">{service.name}</:col>
                <:col :let={service} label="Status">
                  <.tag type={status_kind(service.status)}>
                    {service.status}
                  </.tag>
                </:col>
                <:col :let={service} label="Latency">{service.latency_ms} ms</:col>
                <:col :let={service} label="SLA">{format_percent(service.sla)}</:col>
              </.table_live>
            </.tile>
          </:column>
          <:column sm="4" md="4" lg="8">
            <.tile class="demo-card demo-card--elevated">
              <h3>Recent audit activity</h3>
              <.table_live id="recent-audits" rows={@audits} size="sm">
                <:col :let={audit} label="Time">{audit.time}</:col>
                <:col :let={audit} label="Actor">{audit.actor}</:col>
                <:col :let={audit} label="Action">{audit.action}</:col>
              </.table_live>
            </.tile>
          </:column>
        </.grid>
      </:column>
    </.grid>
    """
  end
end

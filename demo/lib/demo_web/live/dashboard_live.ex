defmodule DemoWeb.DashboardLive do
  use DemoWeb, :live_view

  alias Demo.CloudData
  alias Demo.CloudEvents
  alias Graphene.CarbonComponents, as: CarbonComponents
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
    <CarbonComponents.page_header>
      <:breadcrumb>
        <CarbonComponents.breadcrumb>
          <:item href={~p"/"} text="Cloud Admin" />
          <:item text="Overview" />
        </CarbonComponents.breadcrumb>
      </:breadcrumb>
      <:content title="Overview">
        <CarbonComponents.tag type="green">Production</CarbonComponents.tag>
      </:content>
      <:content_text subtitle="Real-time health, spend, and security posture across Nimbus Cloud." />
    </CarbonComponents.page_header>

    <div class="demo-section demo-card">
      <.form for={@range_form} phx-change="switch_range">
        <CarbonComponents.radio_button_group field={@range_form[:range]} legend_text="Metrics window">
          <:item label="Last 24h" value="24h" />
          <:item label="7 days" value="7d" />
          <:item label="30 days" value="30d" />
        </CarbonComponents.radio_button_group>
      </.form>
    </div>

    <CarbonComponents.grid full_width class="demo-section">
      <:column sm="4" md="2" lg="4">
        <CarbonComponents.tile class="demo-card demo-metric">
          <div class="demo-kicker">Active clusters</div>
          <h3>{@metrics.clusters}</h3>
          <p class="demo-muted">+2 provisioned this quarter</p>
        </CarbonComponents.tile>
      </:column>
      <:column sm="4" md="2" lg="4">
        <CarbonComponents.tile class="demo-card demo-metric">
          <div class="demo-kicker">Monthly spend</div>
          <h3>{format_money(@metrics.monthly_spend)}</h3>
          <CarbonComponents.progress_bar value={@metrics.monthly_spend / @metrics.budget * 100} />
          <p class="demo-muted">Budget {format_money(@metrics.budget)}</p>
        </CarbonComponents.tile>
      </:column>
      <:column sm="4" md="2" lg="4">
        <CarbonComponents.tile class="demo-card demo-metric">
          <div class="demo-kicker">Security posture</div>
          <h3>{@metrics.risk_score}%</h3>
          <p class="demo-muted">Aligned with CIS controls</p>
          <CarbonComponents.button kind="ghost" size="sm" phx-click="acknowledge_risk">
            {if @risk_acknowledged, do: "Acknowledged", else: "Acknowledge"}
          </CarbonComponents.button>
        </CarbonComponents.tile>
      </:column>
      <:column sm="4" md="2" lg="4">
        <CarbonComponents.tile class="demo-card demo-metric">
          <div class="demo-kicker">SLA uptime</div>
          <h3>{format_percent(@metrics.uptime)}</h3>
          <p class="demo-muted">All regions within target</p>
          <CarbonComponents.button kind="ghost" size="sm" phx-click="create_snapshot">
            Create snapshot
          </CarbonComponents.button>
        </CarbonComponents.tile>
      </:column>
    </CarbonComponents.grid>

    <CarbonComponents.grid full_width class="demo-section">
      <:column sm="4" md="4" lg="8">
        <CarbonComponents.tile class="demo-card demo-card--elevated">
          <h3>Service health</h3>
          <CarbonComponents.data_table id="service-health" rows={@services} size="sm">
            <:col :let={service} label="Service">{service.name}</:col>
            <:col :let={service} label="Status">
              <CarbonComponents.tag type={status_kind(service.status)}>{service.status}</CarbonComponents.tag>
            </:col>
            <:col :let={service} label="Latency">{service.latency_ms} ms</:col>
            <:col :let={service} label="SLA">{format_percent(service.sla)}</:col>
          </CarbonComponents.data_table>
        </CarbonComponents.tile>
      </:column>
      <:column sm="4" md="4" lg="8">
        <CarbonComponents.tile class="demo-card demo-card--elevated">
          <h3>Recent audit activity</h3>
          <CarbonComponents.data_table id="recent-audits" rows={@audits} size="sm">
            <:col :let={audit} label="Time">{audit.time}</:col>
            <:col :let={audit} label="Actor">{audit.actor}</:col>
            <:col :let={audit} label="Action">{audit.action}</:col>
          </CarbonComponents.data_table>
        </CarbonComponents.tile>
      </:column>
    </CarbonComponents.grid>
    """
  end
end

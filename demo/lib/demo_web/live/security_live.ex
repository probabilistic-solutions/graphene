defmodule DemoWeb.SecurityLive do
  use DemoWeb, :live_view

  alias Demo.CloudData
  alias Demo.CloudEvents
  alias Graphene.CarbonComponents, as: CarbonComponents
  import DemoWeb.CloudHelpers

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       active_page: :security,
       page_title: "Security · Nimbus Cloud",
       policies: CloudData.policies(),
       last_rotated: "08:10 UTC"
     )}
  end

  @impl true
  def handle_event("rotate_keys", _params, socket) do
    now = DateTime.utc_now() |> Calendar.strftime("%H:%M UTC")

    CloudEvents.broadcast(%{
      id: "evt-#{System.unique_integer([:positive])}",
      time: DateTime.utc_now() |> Calendar.strftime("%H:%M"),
      service: "Security",
      event: "API keys rotated",
      severity: "Medium",
      status: "Completed"
    })

    {:noreply,
     socket
     |> assign(:last_rotated, now)
     |> put_flash(:info, "API keys rotated across all production tenants.")}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <CarbonComponents.grid full_width>
      <:column span="16">
        <CarbonComponents.page_header>
          <:breadcrumb>
            <CarbonComponents.breadcrumb>
              <:item href={~p"/demo"} text="Cloud Admin" />
              <:item text="Security & Compliance" />
            </CarbonComponents.breadcrumb>
          </:breadcrumb>
          <:content title="Security & Compliance">
            <CarbonComponents.tag type="cool-gray">Policy Pack v3.2</CarbonComponents.tag>
          </:content>
          <:content_text subtitle="Continuous policy enforcement, identity hardening, and audit trails." />
        </CarbonComponents.page_header>
      </:column>

      <:column span="16">
        <CarbonComponents.grid full_width class="demo-section">
          <:column sm="4" md="4" lg="8">
            <CarbonComponents.tile class="demo-card">
              <h3>Policy coverage</h3>
              <CarbonComponents.structured_list rows={@policies} condensed>
                <:col :let={policy} label="Policy">{policy.name}</:col>
                <:col :let={policy} label="Coverage">{policy.coverage}%</:col>
                <:col :let={policy} label="Status">
                  <CarbonComponents.tag type={status_kind(policy.status)}>
                    {policy.status}
                  </CarbonComponents.tag>
                </:col>
              </CarbonComponents.structured_list>
            </CarbonComponents.tile>
          </:column>
          <:column sm="4" md="4" lg="8">
            <CarbonComponents.tile class="demo-card demo-card--elevated">
              <h3>Identity controls</h3>
              <div>
                <div class="demo-kicker">Required for production</div>
                <CarbonComponents.stack gap="3">
                  <CarbonComponents.checkbox
                    id="security-mfa"
                    name="security-mfa"
                    label_text="MFA enforced"
                    checked
                  />
                  <CarbonComponents.checkbox
                    id="security-review"
                    name="security-review"
                    label_text="Privileged access review"
                    checked
                  />
                  <CarbonComponents.checkbox
                    id="security-keys"
                    name="security-keys"
                    label_text="Hardware security keys"
                  />
                </CarbonComponents.stack>
              </div>
              <div class="demo-section">
                <CarbonComponents.radio_button_group
                  legend_text="Default access policy"
                  name="default-access-policy"
                >
                  <:item label="Least privilege" value="least" checked />
                  <:item label="Balanced" value="balanced" />
                  <:item label="Open" value="open" />
                </CarbonComponents.radio_button_group>
              </div>
              <div class="demo-section">
                <CarbonComponents.button kind="primary" phx-click="rotate_keys">
                  Rotate API keys
                </CarbonComponents.button>
                <p class="demo-muted">Last rotated {@last_rotated}</p>
              </div>
            </CarbonComponents.tile>
          </:column>
        </CarbonComponents.grid>
      </:column>

      <:column span="16">
        <div class="demo-section demo-card">
          <CarbonComponents.accordion>
            <:item title="Network perimeter" open>
              Edge ingress is protected by WAF ruleset 6.2 with managed threat detection.
              New rule proposals are staged in "Audit" mode for 24 hours.
            </:item>
            <:item title="Data protection">
              All persistent volumes use envelope encryption with quarterly key rotation.
            </:item>
            <:item title="Incident response">
              On-call rotation schedules are synchronized with PagerDuty and Opsgenie.
            </:item>
          </CarbonComponents.accordion>
        </div>
      </:column>
    </CarbonComponents.grid>
    """
  end
end

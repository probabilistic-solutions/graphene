defmodule DemoWeb.SupportLive do
  use DemoWeb, :live_view

  alias Graphene.CarbonComponents, as: CarbonComponents

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       active_page: :support,
       page_title: "Support · Nimbus Cloud",
       ticket_open: false
     )}
  end

  @impl true
  def handle_event("open_ticket", _params, socket) do
    {:noreply,
     socket
     |> assign(:ticket_open, true)
     |> put_flash(:info, "Support ticket #NIM-4821 created.")}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <CarbonComponents.page_header>
      <:breadcrumb>
        <CarbonComponents.breadcrumb>
          <:item href={~p"/"} text="Cloud Admin" />
          <:item text="Support" />
        </CarbonComponents.breadcrumb>
      </:breadcrumb>
      <:content title="Support">
        <CarbonComponents.tag type="purple">24/7 coverage</CarbonComponents.tag>
      </:content>
      <:content_text subtitle="Runbooks, documentation, and live support channels." />
    </CarbonComponents.page_header>

    <div class="demo-section demo-card demo-card--elevated">
      <CarbonComponents.tabs type="contained">
        <:tab title="Runbooks">
          <CarbonComponents.accordion>
            <:item title="Database failover" open>
              <p class="demo-muted">Estimated runtime: 12 minutes</p>
              <CarbonComponents.code_snippet type="multi">
                <code>nimbus ctl failover --cluster aurora --region us-east-1</code>
              </CarbonComponents.code_snippet>
            </:item>
            <:item title="Region evacuation">
              <CarbonComponents.code_snippet type="multi">
                <code>nimbus ctl evacuate --region eu-west-1 --approve</code>
              </CarbonComponents.code_snippet>
            </:item>
          </CarbonComponents.accordion>
        </:tab>
        <:tab title="Documentation">
          <CarbonComponents.tile class="demo-card">
            <h3>Quickstart</h3>
            <p class="demo-muted">Deploy your first managed cluster in under 10 minutes.</p>
            <CarbonComponents.link href="https://www.ibm.com/docs/en" target="_blank">Open docs</CarbonComponents.link>
          </CarbonComponents.tile>
        </:tab>
        <:tab title="Support">
          <CarbonComponents.inline_notification kind="info" open>
            <:title>Dedicated support</:title>
            <:subtitle>Enterprise plans include 15-minute response time and live chat.</:subtitle>
          </CarbonComponents.inline_notification>
          <div class="demo-section">
            <CarbonComponents.button kind="primary" phx-click="open_ticket">Open support ticket</CarbonComponents.button>
          </div>
        </:tab>
      </CarbonComponents.tabs>
    </div>
    """
  end
end

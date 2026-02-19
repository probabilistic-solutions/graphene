defmodule DemoWeb.SupportLive do
  use DemoWeb, :live_view

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
    <.page_header>
      <:breadcrumb>
        <.breadcrumb size="sm">
          <:item href={~p"/demo"} text="Cloud Admin" />
        </.breadcrumb>
      </:breadcrumb>
      <:content title="Support">
        <.tag type="purple">24/7 coverage</.tag>
      </:content>
      <:content_text subtitle="Runbooks, documentation, and live support channels." />
    </.page_header>

    <.grid>
      <:column span="16">
        <div class="demo-section demo-card demo-card--elevated">
          <.tabs type="contained">
            <:tab title="Runbooks">
              <.accordion>
                <:item title="Database failover" open>
                  <p class="demo-muted">Estimated runtime: 12 minutes</p>
                  <.code_snippet type="multi">
                    <code>nimbus ctl failover --cluster aurora --region us-east-1</code>
                  </.code_snippet>
                </:item>
                <:item title="Region evacuation">
                  <.code_snippet type="multi">
                    <code>nimbus ctl evacuate --region eu-west-1 --approve</code>
                  </.code_snippet>
                </:item>
              </.accordion>
            </:tab>
            <:tab title="Documentation">
              <.tile class="demo-card">
                <h3>Quickstart</h3>
                <p class="demo-muted">Deploy your first managed cluster in under 10 minutes.</p>
                <.link href="https://www.ibm.com/docs/en" target="_blank">
                  Open docs
                </.link>
              </.tile>
            </:tab>
            <:tab title="Support">
              <.inline_notification kind="info" open>
                <:title>Dedicated support</:title>
                <:subtitle>
                  Enterprise plans include 15-minute response time and live chat.
                </:subtitle>
              </.inline_notification>
              <div class="demo-section">
                <.button kind="primary" phx-click="open_ticket">
                  Open support ticket
                </.button>
              </div>
            </:tab>
          </.tabs>
        </div>
      </:column>
    </.grid>
    """
  end
end

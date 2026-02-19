defmodule DemoWeb.OperationsLive do
  use DemoWeb, :live_view

  alias Demo.CloudData
  alias Demo.CloudEvents

  import DemoWeb.CloudHelpers

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       active_page: :operations,
       page_title: "Operations · Nimbus Cloud",
       incidents: CloudData.incidents(),
       modal_incident: nil
     )}
  end

  @impl true
  def handle_event("open_incident", %{"id" => id}, socket) do
    incident = Enum.find(socket.assigns.incidents, &(&1.id == id))
    {:noreply, assign(socket, :modal_incident, incident)}
  end

  def handle_event("close_incident", _params, socket) do
    {:noreply, assign(socket, :modal_incident, nil)}
  end

  def handle_event("resolve_incident", %{"id" => id}, socket) do
    incidents =
      Enum.map(socket.assigns.incidents, fn incident ->
        if incident.id == id do
          %{incident | status: "Resolved"}
        else
          incident
        end
      end)

    CloudEvents.broadcast(%{
      id: "evt-#{System.unique_integer([:positive])}",
      time: current_time(),
      service: "Operations",
      event: "Incident #{id} resolved",
      severity: "Low",
      status: "Completed"
    })

    {:noreply,
     socket
     |> assign(:incidents, incidents)
     |> assign(:modal_incident, nil)
     |> put_flash(:info, "Incident #{id} marked as resolved.")}
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
              <:item text="Operations" />
            </.breadcrumb>
          </:breadcrumb>
          <:content title="Operations">
            <.tag type="green">On-call</.tag>
          </:content>
          <:content_text subtitle="Incident triage, deployments, and runtime safeguards." />
        </.page_header>
      </:column>

      <:column span="16">
        <div class="demo-section demo-card demo-card--elevated">
          <.tabs type="container">
            <:tab title="Incidents">
              <.table_live id="incident-table" rows={@incidents} size="sm">
                <:col :let={incident} label="ID">{incident.id}</:col>
                <:col :let={incident} label="Title">{incident.title}</:col>
                <:col :let={incident} label="Severity">
                  <.tag type={severity_kind(incident.severity)}>
                    {incident.severity}
                  </.tag>
                </:col>
                <:col :let={incident} label="Status">
                  <.tag type={status_kind(incident.status)}>
                    {incident.status}
                  </.tag>
                </:col>
                <:col :let={incident} label="Owner">{incident.owner}</:col>
                <:col :let={incident} label="Opened">{incident.opened_at}</:col>
                <:action :let={incident}>
                  <.stack orientation="horizontal" gap="2">
                    <.button
                      kind="ghost"
                      size="sm"
                      phx-click="open_incident"
                      phx-value-id={incident.id}
                    >
                      Details
                    </.button>
                    <.button
                      kind="ghost"
                      size="sm"
                      phx-click="resolve_incident"
                      phx-value-id={incident.id}
                    >
                      Resolve
                    </.button>
                  </.stack>
                </:action>
              </.table_live>
            </:tab>
            <:tab title="Deployments">
              <.tile class="demo-card">
                <h3>Deployment guardrails</h3>
                <p class="demo-muted">Automatic rollbacks are enabled for production clusters.</p>
                <.progress_indicator current_index="2">
                  <:step label="Build" />
                  <:step label="Test" />
                  <:step label="Canary" />
                  <:step label="Rollout" />
                </.progress_indicator>
              </.tile>
            </:tab>
            <:tab title="Maintenance">
              <.tile class="demo-card">
                <h3>Upcoming maintenance</h3>
                <.inline_notification kind="info" open>
                  <:title>Region upgrade</:title>
                  <:subtitle>eu-west-1 scheduled for kernel patching at 02:00 UTC.</:subtitle>
                </.inline_notification>
              </.tile>
            </:tab>
          </.tabs>
        </div>
      </:column>
    </.grid>

    <.modal :if={@modal_incident} open>
      <:body>
        <.modal_header>
          <.modal_label>{@modal_incident.id}</.modal_label>
          <.modal_heading>{@modal_incident.title}</.modal_heading>
        </.modal_header>
        <p>
          Severity: <strong>{@modal_incident.severity}</strong>
          · Owner: <strong>{@modal_incident.owner}</strong>
        </p>
        <p class="demo-muted">Opened {@modal_incident.opened_at} — status {@modal_incident.status}</p>
      </:body>
      <:footer_button label="Close" attrs={%{:"phx-click" => "close_incident"}} />
      <:footer_button
        label="Resolve"
        kind="primary"
        attrs={
          %{
            :"phx-click" => "resolve_incident",
            :"phx-value-id" => @modal_incident.id
          }
        }
      />
    </.modal>
    """
  end
end

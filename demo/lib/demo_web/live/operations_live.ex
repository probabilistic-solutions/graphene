defmodule DemoWeb.OperationsLive do
  use DemoWeb, :live_view

  alias Demo.CloudData
  alias Demo.CloudEvents
  alias Graphene.CarbonComponents, as: CarbonComponents
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
    <CarbonComponents.page_header>
      <:breadcrumb>
        <CarbonComponents.breadcrumb>
          <:item href={~p"/"} text="Cloud Admin" />
          <:item text="Operations" />
        </CarbonComponents.breadcrumb>
      </:breadcrumb>
      <:content title="Operations">
        <CarbonComponents.tag type="green">On-call</CarbonComponents.tag>
      </:content>
      <:content_text subtitle="Incident triage, deployments, and runtime safeguards." />
    </CarbonComponents.page_header>

    <div class="demo-section demo-card demo-card--elevated">
      <CarbonComponents.tabs type="container">
        <:tab title="Incidents">
          <CarbonComponents.data_table id="incident-table" rows={@incidents} size="sm">
            <:col :let={incident} label="ID">{incident.id}</:col>
            <:col :let={incident} label="Title">{incident.title}</:col>
            <:col :let={incident} label="Severity">
              <CarbonComponents.tag type={severity_kind(incident.severity)}>{incident.severity}</CarbonComponents.tag>
            </:col>
            <:col :let={incident} label="Status">
              <CarbonComponents.tag type={status_kind(incident.status)}>{incident.status}</CarbonComponents.tag>
            </:col>
            <:col :let={incident} label="Owner">{incident.owner}</:col>
            <:col :let={incident} label="Opened">{incident.opened_at}</:col>
            <:action :let={incident}>
              <CarbonComponents.stack orientation="horizontal" gap="2">
                <CarbonComponents.button kind="ghost" size="sm" phx-click="open_incident" phx-value-id={incident.id}>
                  Details
                </CarbonComponents.button>
                <CarbonComponents.button
                  kind="ghost"
                  size="sm"
                  phx-click="resolve_incident"
                  phx-value-id={incident.id}
                >
                  Resolve
                </CarbonComponents.button>
              </CarbonComponents.stack>
            </:action>
          </CarbonComponents.data_table>
        </:tab>
        <:tab title="Deployments">
          <CarbonComponents.tile class="demo-card">
            <h3>Deployment guardrails</h3>
            <p class="demo-muted">Automatic rollbacks are enabled for production clusters.</p>
            <CarbonComponents.progress_indicator current_index="2">
              <:step label="Build" />
              <:step label="Test" />
              <:step label="Canary" />
              <:step label="Rollout" />
            </CarbonComponents.progress_indicator>
          </CarbonComponents.tile>
        </:tab>
        <:tab title="Maintenance">
          <CarbonComponents.tile class="demo-card">
            <h3>Upcoming maintenance</h3>
          <CarbonComponents.inline_notification kind="info" open>
            <:title>Region upgrade</:title>
            <:subtitle>eu-west-1 scheduled for kernel patching at 02:00 UTC.</:subtitle>
          </CarbonComponents.inline_notification>
          </CarbonComponents.tile>
        </:tab>
      </CarbonComponents.tabs>
    </div>

    <CarbonComponents.modal :if={@modal_incident} open>
      <:body>
        <CarbonComponents.modal_header>
          <CarbonComponents.modal_label>{@modal_incident.id}</CarbonComponents.modal_label>
          <CarbonComponents.modal_heading>{@modal_incident.title}</CarbonComponents.modal_heading>
        </CarbonComponents.modal_header>
        <p>
          Severity: <strong>{@modal_incident.severity}</strong> · Owner: <strong>{@modal_incident.owner}</strong>
        </p>
        <p class="demo-muted">Opened {@modal_incident.opened_at} — status {@modal_incident.status}</p>
      </:body>
      <:footer_button label="Close" attrs={%{:"phx-click" => "close_incident"}} />
      <:footer_button
        label="Resolve"
        kind="primary"
        attrs={%{
          :"phx-click" => "resolve_incident",
          :"phx-value-id" => @modal_incident.id
        }}
      />
    </CarbonComponents.modal>
    """
  end
end

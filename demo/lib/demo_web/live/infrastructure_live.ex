defmodule DemoWeb.InfrastructureLive do
  use DemoWeb, :live_view

  alias Demo.CloudData
  alias Demo.CloudEvents
  alias Graphene.CarbonComponents, as: CarbonComponents
  import DemoWeb.CloudHelpers

  @impl true
  def mount(_params, _session, socket) do
    clusters = CloudData.clusters()

    {:ok,
     assign(socket,
       active_page: :infrastructure,
       page_title: "Infrastructure · Nimbus Cloud",
       clusters: clusters,
       search: "",
       filter_form: to_form(%{"query" => ""}, as: :filter)
     )}
  end

  @impl true
  def handle_event("filter", %{"filter" => %{"query" => query}}, socket) do
    {:noreply, assign(socket, search: query, filter_form: to_form(%{"query" => query}, as: :filter))}
  end

  def handle_event("scale_cluster", %{"id" => id}, socket) do
    {clusters, scaled} = update_cluster(socket.assigns.clusters, id, &Map.update!(&1, :nodes, fn v -> v + 2 end))

    if scaled do
      CloudEvents.broadcast(%{
        id: "evt-#{System.unique_integer([:positive])}",
        time: current_time(),
        service: "Clusters",
        event: "Scaled #{scaled.name} to #{scaled.nodes} nodes",
        severity: "Medium",
        status: "Completed"
      })
    end

    {:noreply,
     socket
     |> assign(:clusters, clusters)
     |> put_flash(:info, "Scaling initiated for #{scaled && scaled.name}")}
  end

  def handle_event("restart_cluster", %{"id" => id}, socket) do
    {clusters, restarted} = update_cluster(socket.assigns.clusters, id, &Map.put(&1, :status, "Maintenance"))

    if restarted do
      CloudEvents.broadcast(%{
        id: "evt-#{System.unique_integer([:positive])}",
        time: current_time(),
        service: "Clusters",
        event: "Restart scheduled for #{restarted.name}",
        severity: "Low",
        status: "Queued"
      })
    end

    {:noreply,
     socket
     |> assign(:clusters, clusters)
     |> put_flash(:info, "Restart scheduled for #{restarted && restarted.name}")}
  end

  defp update_cluster(clusters, id, fun) do
    {updated, match} =
      Enum.map_reduce(clusters, nil, fn cluster, acc ->
        if cluster.id == id do
          updated = fun.(cluster)
          {updated, updated}
        else
          {cluster, acc}
        end
      end)

    {updated, match}
  end

  defp current_time do
    DateTime.utc_now() |> Calendar.strftime("%H:%M")
  end

  defp filtered_clusters(clusters, query) do
    query = String.trim(String.downcase(query || ""))

    if query == "" do
      clusters
    else
      Enum.filter(clusters, fn cluster ->
        String.contains?(String.downcase(cluster.name), query) or
          String.contains?(String.downcase(cluster.region), query) or
          String.contains?(String.downcase(cluster.environment), query)
      end)
    end
  end

  @impl true
  def render(assigns) do
    clusters = filtered_clusters(assigns.clusters, assigns.search)

    assigns = assign(assigns, :filtered_clusters, clusters)

    ~H"""
    <CarbonComponents.page_header>
      <:breadcrumb>
        <CarbonComponents.breadcrumb>
          <:item href={~p"/"} text="Cloud Admin" />
          <:item text="Infrastructure" />
        </CarbonComponents.breadcrumb>
      </:breadcrumb>
      <:content title="Infrastructure">
        <CarbonComponents.tag type="blue">Kubernetes</CarbonComponents.tag>
      </:content>
      <:content_text subtitle="Manage multi-region clusters, node pools, and workload scaling." />
    </CarbonComponents.page_header>

    <div class="demo-section demo-card">
      <.form for={@filter_form} phx-change="filter">
        <CarbonComponents.text_input field={@filter_form[:query]} label="Search clusters" />
      </.form>
    </div>

    <div class="demo-section demo-card demo-card--elevated">
      <CarbonComponents.data_table id="cluster-table" rows={@filtered_clusters} size="md">
        <:col :let={cluster} label="Cluster">{cluster.name}</:col>
        <:col :let={cluster} label="Region">{cluster.region}</:col>
        <:col :let={cluster} label="Env">{String.capitalize(cluster.environment)}</:col>
        <:col :let={cluster} label="Nodes">{cluster.nodes}</:col>
        <:col :let={cluster} label="Version">{cluster.version}</:col>
        <:col :let={cluster} label="Status">
          <CarbonComponents.tag type={status_kind(cluster.status)}>{cluster.status}</CarbonComponents.tag>
        </:col>
        <:action :let={cluster}>
          <CarbonComponents.stack orientation="horizontal" gap="2">
            <CarbonComponents.button
              kind="ghost"
              size="sm"
              phx-click="scale_cluster"
              phx-value-id={cluster.id}
            >
              Scale +2
            </CarbonComponents.button>
            <CarbonComponents.button
              kind="ghost"
              size="sm"
              phx-click="restart_cluster"
              phx-value-id={cluster.id}
            >
              Restart
            </CarbonComponents.button>
          </CarbonComponents.stack>
        </:action>
      </CarbonComponents.data_table>
    </div>
    """
  end
end

defmodule DemoWeb.InfrastructureLive do
  use DemoWeb, :live_view

  alias Demo.CloudData
  alias Demo.CloudEvents

  alias Graphene.Icons
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
    {:noreply,
     assign(socket, search: query, filter_form: to_form(%{"query" => query}, as: :filter))}
  end

  def handle_event("scale_cluster", %{"id" => id}, socket) do
    {clusters, scaled} =
      update_cluster(socket.assigns.clusters, id, &Map.update!(&1, :nodes, fn v -> v + 2 end))

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
    {clusters, restarted} =
      update_cluster(socket.assigns.clusters, id, &Map.put(&1, :status, "Maintenance"))

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
    <.grid full_width>
      <:column span="16">
        <.page_header>
          <:breadcrumb>
            <.breadcrumb>
              <:item href={~p"/demo"} text="Cloud Admin" />
              <:item text="Infrastructure" />
            </.breadcrumb>
          </:breadcrumb>
          <:content title="Infrastructure">
            <.tag type="blue">Kubernetes</.tag>
          </:content>
          <:content_text subtitle="Manage multi-region clusters, node pools, and workload scaling." />
        </.page_header>
      </:column>

      <:column span="16">
        <div class="demo-section demo-card">
          <.form for={@filter_form} phx-change="filter">
            <.text_input field={@filter_form[:query]} label="Search clusters" />
          </.form>
        </div>
      </:column>

      <:column span="16">
        <div class="demo-section demo-card">
          <div class="demo-kicker">Grid</div>
          <h3>Implicit rows in practice</h3>
          <p class="demo-muted">Spans wrap automatically when they exceed the grid width.</p>
          <.grid class="demo-grid-example">
            <:column span="6">
              <div class="demo-grid-widget">
                <div class="demo-grid-widget__header">
                  <Icons.icon name="chip" size={16} />
                  <span class="demo-grid-widget__title">Compute pools</span>
                  <span class="demo-grid-widget__tag">
                    <.tag type="green">Stable</.tag>
                  </span>
                </div>
                <div class="demo-grid-widget__value">42</div>
                <div class="demo-grid-widget__meta">6 reserved for failover</div>
              </div>
            </:column>
            <:column span="6">
              <div class="demo-grid-widget">
                <div class="demo-grid-widget__header">
                  <Icons.icon name="cloud-satellite" size={16} />
                  <span class="demo-grid-widget__title">Edge clusters</span>
                </div>
                <div class="demo-grid-widget__value">18</div>
                <div class="demo-grid-widget__meta">4 under maintenance</div>
              </div>
            </:column>
            <:column span="4">
              <div class="demo-grid-widget">
                <div class="demo-grid-widget__header">
                  <Icons.icon name="security" size={16} />
                  <span class="demo-grid-widget__title">Patch compliance</span>
                </div>
                <div class="demo-grid-widget__value">92%</div>
                <.progress_bar value={92} />
                <div class="demo-grid-widget__meta">Next window in 6 days</div>
              </div>
            </:column>
            <:column span="8">
              <div class="demo-grid-widget demo-grid-widget--wide">
                <div class="demo-grid-widget__header">
                  <Icons.icon name="network--3" size={16} />
                  <span class="demo-grid-widget__title">Ingress capacity</span>
                  <span class="demo-grid-widget__tag">
                    <.tag type="blue">Moderate</.tag>
                  </span>
                </div>
                <div class="demo-grid-widget__value">68%</div>
                <.progress_bar value={68} />
                <div class="demo-grid-widget__meta">Route shift recommended in 2 regions</div>
              </div>
            </:column>
            <:column span="8">
              <div class="demo-grid-widget demo-grid-widget--wide">
                <div class="demo-grid-widget__header">
                  <Icons.icon name="notification" size={16} />
                  <span class="demo-grid-widget__title">Snapshot backlog</span>
                  <span class="demo-grid-widget__tag">
                    <.tag type="red">Action</.tag>
                  </span>
                </div>
                <div class="demo-grid-widget__list">
                  <div class="demo-grid-widget__list-row">
                    <span>Database Aurora - 12 pending</span>
                    <span class="demo-grid-widget__meta">ETA 45m</span>
                  </div>
                  <div class="demo-grid-widget__list-row">
                    <span>Object storage - 3 pending</span>
                    <span class="demo-grid-widget__meta">ETA 30m</span>
                  </div>
                </div>
              </div>
            </:column>
          </.grid>
        </div>
      </:column>

      <:column span="16">
        <div class="demo-section demo-card demo-card--elevated">
          <.table_live id="cluster-table" rows={@filtered_clusters} size="md">
            <:col :let={cluster} label="Cluster">{cluster.name}</:col>
            <:col :let={cluster} label="Region">{cluster.region}</:col>
            <:col :let={cluster} label="Env">{String.capitalize(cluster.environment)}</:col>
            <:col :let={cluster} label="Nodes">{cluster.nodes}</:col>
            <:col :let={cluster} label="Version">{cluster.version}</:col>
            <:col :let={cluster} label="Status">
              <.tag type={status_kind(cluster.status)}>
                {cluster.status}
              </.tag>
            </:col>
            <:action :let={cluster}>
              <.stack orientation="horizontal" gap="2">
                <.button
                  kind="ghost"
                  size="sm"
                  phx-click="scale_cluster"
                  phx-value-id={cluster.id}
                >
                  Scale +2
                </.button>
                <.button
                  kind="ghost"
                  size="sm"
                  phx-click="restart_cluster"
                  phx-value-id={cluster.id}
                >
                  Restart
                </.button>
              </.stack>
            </:action>
          </.table_live>
        </div>
      </:column>
    </.grid>
    """
  end
end

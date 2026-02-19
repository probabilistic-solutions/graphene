defmodule DemoWeb.CostsLive do
  use DemoWeb, :live_view

  alias Demo.CloudData

  import DemoWeb.CloudHelpers

  @impl true
  def mount(_params, _session, socket) do
    metrics = Demo.CloudData.summary_metrics()

    {:ok,
     assign(socket,
       active_page: :costs,
       page_title: "Cost Management · Nimbus Cloud",
       budget: metrics.budget,
       spend: metrics.monthly_spend,
       cost_centers: CloudData.cost_centers(),
       budget_form: to_form(%{"budget" => metrics.budget}, as: :budget)
     )}
  end

  @impl true
  def handle_event("update_budget", %{"budget" => %{"budget" => value}}, socket) do
    budget = parse_int(value, socket.assigns.budget)

    {:noreply,
     socket
     |> assign(:budget, budget)
     |> assign(:budget_form, to_form(%{"budget" => budget}, as: :budget))
     |> put_flash(:info, "Budget updated to #{format_money(budget)}")}
  end

  defp parse_int(nil, fallback), do: fallback

  defp parse_int(value, fallback) do
    case Integer.parse(to_string(value)) do
      {int, _} -> int
      :error -> fallback
    end
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
      <:content title="Cost Management">
        <.tag type="warm-gray">FinOps</.tag>
      </:content>
      <:content_text subtitle="Track spend, forecast demand, and allocate budgets across teams." />
    </.page_header>

    <.grid>
      <:column span="16">
        <.grid full_width class="demo-section">
          <:column sm="4" md="4" lg="8">
            <.tile class="demo-card">
              <h3>Budget health</h3>
              <p class="demo-muted">Current month spend</p>
              <h2>{format_money(@spend)}</h2>
              <.progress_bar value={@spend / @budget * 100} />
              <p class="demo-muted">Budget {format_money(@budget)}</p>
            </.tile>
          </:column>
          <:column sm="4" md="4" lg="8">
            <.tile class="demo-card demo-card--elevated">
              <h3>Adjust budget</h3>
              <.form for={@budget_form} phx-change="update_budget">
                <.number_input
                  field={@budget_form[:budget]}
                  label="Monthly budget"
                  min="0"
                />
              </.form>
              <p class="demo-muted">Changes apply immediately to forecasts and alerts.</p>
            </.tile>
          </:column>
        </.grid>
      </:column>

      <:column span="16">
        <div class="demo-section demo-card demo-card--elevated">
          <h3>Cost centers</h3>
          <.table_live id="cost-centers" rows={@cost_centers} size="sm">
            <:col :let={center} label="Team">{center.name}</:col>
            <:col :let={center} label="Month">{center.month}</:col>
            <:col :let={center} label="Spend">{format_money(center.spend)}</:col>
            <:col :let={center} label="Delta">
              <.tag type={if(center.change >= 0, do: "purple", else: "cool-gray")}>
                {delta_label(center.change)}
              </.tag>
            </:col>
          </.table_live>
        </div>
      </:column>
    </.grid>
    """
  end
end

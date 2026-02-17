defmodule DemoWeb.CostsLive do
  use DemoWeb, :live_view

  alias Demo.CloudData
  alias Graphene.CarbonComponents, as: CarbonComponents
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
    <CarbonComponents.page_header>
      <:breadcrumb>
        <CarbonComponents.breadcrumb>
          <:item href={~p"/"} text="Cloud Admin" />
          <:item text="Cost Management" />
        </CarbonComponents.breadcrumb>
      </:breadcrumb>
      <:content title="Cost Management">
        <CarbonComponents.tag type="warm-gray">FinOps</CarbonComponents.tag>
      </:content>
      <:content_text subtitle="Track spend, forecast demand, and allocate budgets across teams." />
    </CarbonComponents.page_header>

    <CarbonComponents.grid full_width class="demo-section">
      <:column sm="4" md="4" lg="8">
        <CarbonComponents.tile class="demo-card">
          <h3>Budget health</h3>
          <p class="demo-muted">Current month spend</p>
          <h2>{format_money(@spend)}</h2>
          <CarbonComponents.progress_bar value={@spend / @budget * 100} />
          <p class="demo-muted">Budget {format_money(@budget)}</p>
        </CarbonComponents.tile>
      </:column>
      <:column sm="4" md="4" lg="8">
        <CarbonComponents.tile class="demo-card demo-card--elevated">
          <h3>Adjust budget</h3>
          <.form for={@budget_form} phx-change="update_budget">
            <CarbonComponents.number_input field={@budget_form[:budget]} label="Monthly budget" min="0" />
          </.form>
          <p class="demo-muted">Changes apply immediately to forecasts and alerts.</p>
        </CarbonComponents.tile>
      </:column>
    </CarbonComponents.grid>

    <div class="demo-section demo-card demo-card--elevated">
      <h3>Cost centers</h3>
      <CarbonComponents.data_table id="cost-centers" rows={@cost_centers} size="sm">
        <:col :let={center} label="Team">{center.name}</:col>
        <:col :let={center} label="Month">{center.month}</:col>
        <:col :let={center} label="Spend">{format_money(center.spend)}</:col>
        <:col :let={center} label="Delta">
          <CarbonComponents.tag type={if(center.change >= 0, do: "purple", else: "cool-gray")}>
            {delta_label(center.change)}
          </CarbonComponents.tag>
        </:col>
      </CarbonComponents.data_table>
    </div>
    """
  end
end

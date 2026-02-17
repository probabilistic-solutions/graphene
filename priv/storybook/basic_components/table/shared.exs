defmodule Storybook.BasicComponents.Table.Shared do
  @moduledoc false
  use Phoenix.Component

  alias Graphene.CarbonComponents
  alias Graphene.Icons

  @rows [
    %{
      id: 1,
      name: "Load Balancer 3",
      protocol: "HTTP",
      port: "3000",
      rule: "Round robin",
      group: "Kevin's VM Groups",
      status: "Disabled"
    },
    %{
      id: 2,
      name: "Load Balancer 1",
      protocol: "HTTP",
      port: "443",
      rule: "Round robin",
      group: "Maureen's VM Groups",
      status: "Starting"
    },
    %{
      id: 3,
      name: "Load Balancer 2",
      protocol: "HTTP",
      port: "80",
      rule: "DNS delegation",
      group: "Andrew's VM Groups",
      status: "Active"
    },
    %{
      id: 4,
      name: "Load Balancer 6",
      protocol: "HTTP",
      port: "3000",
      rule: "Round robin",
      group: "Marc's VM Groups",
      status: "Disabled"
    },
    %{
      id: 5,
      name: "Load Balancer 4",
      protocol: "HTTP",
      port: "443",
      rule: "Round robin",
      group: "Mel's VM Groups",
      status: "Starting"
    },
    %{
      id: 6,
      name: "Load Balancer 5",
      protocol: "HTTP",
      port: "80",
      rule: "DNS delegation",
      group: "Ronja's VM Groups",
      status: "Active"
    }
  ]

  @columns [
    %{label: "Name", key: :name},
    %{label: "Protocol", key: :protocol},
    %{label: "Port", key: :port},
    %{label: "Rule", key: :rule},
    %{label: "Attached groups", key: :group},
    %{label: "Status", key: :status}
  ]

  def rows, do: @rows
  def columns, do: @columns

  def row_id(row), do: "row-#{row.id}"

  def expanded_content(row) do
    "Expandable content for #{row.name}"
  end

  def ai_label_markup(assigns \\ %{}) do
    ~H"""
    <CarbonComponents.ai_label alignment="bottom-start">
      <:body_text>
        <p class="secondary">AI Explained</p>
        <h2 class="ai-label-heading">84%</h2>
        <p class="secondary bold">Confidence score</p>
        <p class="secondary">Model type: Foundation</p>
      </:body_text>
      <:action_button>View literature</:action_button>
    </CarbonComponents.ai_label>
    """
  end

  def ai_label_header_label do
    fn ->
      assigns = %{}

      ~H"""
      Attached groups
      <CarbonComponents.ai_label alignment="bottom-start">
        <:body_text>
          <p class="secondary">AI Explained</p>
          <p class="secondary">Sorting guidance</p>
        </:body_text>
        <:action_button>View details</:action_button>
      </CarbonComponents.ai_label>
      """
    end
  end

  def overflow_menu_icon(assigns \\ %{}) do
    ~H"""
    <Icons.icon fit="width" name="overflow-menu--horizontal" />
    """
  end
end

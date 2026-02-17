defmodule Storybook.CarbonComponents.DataTable.Shared do
  @moduledoc false

  use Phoenix.Component

  alias Graphene.CarbonComponents, as: Carbon

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

  def ai_label(assigns) do
    ~H"""
    <Carbon.ai_label alignment="bottom-start">
      <div slot="body-text">
        <p class="secondary">AI Explained</p>
        <h2 class="ai-label-heading">84%</h2>
        <p class="secondary bold">Confidence score</p>
        <p class="secondary">Model type: Foundation</p>
      </div>
      <Carbon.ai_label_action_button>View literature</Carbon.ai_label_action_button>
    </Carbon.ai_label>
    """
  end

  def ai_label_header(assigns) do
    ~H"""
    <span>Attached groups</span>
    <Carbon.ai_label alignment="bottom-start" kind="inline">
      <div slot="body-text">
        <p class="secondary">AI Explained</p>
        <p class="secondary">Sorting guidance</p>
      </div>
      <Carbon.ai_label_action_button>View details</Carbon.ai_label_action_button>
    </Carbon.ai_label>
    """
  end

  def overflow_icon(assigns) do
    ~H"""
    <span aria-hidden="true">...</span>
    """
  end
end

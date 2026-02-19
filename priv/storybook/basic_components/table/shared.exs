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
    <CarbonComponents.ai_label alignment="bottom-left">
      <div slot="body-text">
        <p class="secondary">AI Explained</p>
        <h2 class="ai-label-heading">84%</h2>
        <p class="secondary bold">Confidence score</p>
        <p class="secondary">
          Lorem ipsum dolor sit amet, di os consectetur adipiscing elit, sed do
          eiusmod tempor incididunt ut fsil labore et dolore magna aliqua.
        </p>
        <hr />
        <p class="secondary">Model type</p>
        <p class="bold">Foundation model</p>
      </div>

      <CarbonComponents.icon_button kind="ghost" size="lg" slot="actions">
        <svg
          focusable="false"
          preserveAspectRatio="xMidYMid meet"
          xmlns="http://www.w3.org/2000/svg"
          fill="currentColor"
          slot="icon"
          width="16"
          height="16"
          viewBox="0 0 16 16"
          aria-hidden="true"
        >
          <path d="M15.5,7.8C14.3,4.7,11.3,2.6,8,2.5C4.7,2.6,1.7,4.7,0.5,7.8c0,0.1,0,0.2,0,0.3c1.2,3.1,4.1,5.2,7.5,5.3	c3.3-0.1,6.3-2.2,7.5-5.3C15.5,8.1,15.5,7.9,15.5,7.8z M8,12.5c-2.7,0-5.4-2-6.5-4.5c1-2.5,3.8-4.5,6.5-4.5s5.4,2,6.5,4.5	C13.4,10.5,10.6,12.5,8,12.5z"></path><path d="M8,5C6.3,5,5,6.3,5,8s1.3,3,3,3s3-1.3,3-3S9.7,5,8,5z M8,10c-1.1,0-2-0.9-2-2s0.9-2,2-2s2,0.9,2,2S9.1,10,8,10z"></path>
        </svg>
        <:tooltip_content tag="span">View</:tooltip_content>
      </CarbonComponents.icon_button>
      <CarbonComponents.icon_button kind="ghost" size="lg" slot="actions">
        <svg
          focusable="false"
          preserveAspectRatio="xMidYMid meet"
          xmlns="http://www.w3.org/2000/svg"
          fill="currentColor"
          slot="icon"
          width="16"
          height="16"
          viewBox="0 0 32 32"
          aria-hidden="true"
        >
          <path d="M28,8H20.8284L17.4143,4.5859A2,2,0,0,0,16,4H4A2,2,0,0,0,2,6V26a2,2,0,0,0,2,2H28a2,2,0,0,0,2-2V10A2,2,0,0,0,28,8ZM8,26V14h8v6.17l-2.59-2.58L12,19l5,5,5-5-1.41-1.41L18,20.17V14a2.0025,2.0025,0,0,0-2-2H8a2.0025,2.0025,0,0,0-2,2V26H4V6H16l4,4h8v2H22v2h6V26Z"></path>
        </svg>
        <:tooltip_content tag="span">Open folder</:tooltip_content>
      </CarbonComponents.icon_button>
      <CarbonComponents.icon_button kind="ghost" size="lg" slot="actions">
        <svg
          focusable="false"
          preserveAspectRatio="xMidYMid meet"
          xmlns="http://www.w3.org/2000/svg"
          fill="currentColor"
          slot="icon"
          width="16"
          height="16"
          viewBox="0 0 32 32"
          aria-hidden="true"
        >
          <path d="M26,28H6a2.0021,2.0021,0,0,1-2-2V11A2.0021,2.0021,0,0,1,6,9h5.6665a2.0119,2.0119,0,0,1,1.2007.4L16.3335,12H26a2.0021,2.0021,0,0,1,2,2V26A2.0021,2.0021,0,0,1,26,28ZM11.6665,11H5.9985L6,26H26V14H15.6665Z"></path><path d="M28,9H17.6665l-4-3H6V4h7.6665a2.0119,2.0119,0,0,1,1.2007.4L18.3335,7H28Z"></path>
        </svg>
        <:tooltip_content tag="span">Folders</:tooltip_content>
      </CarbonComponents.icon_button>
      <CarbonComponents.ai_label_action_button>View Literature</CarbonComponents.ai_label_action_button>
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

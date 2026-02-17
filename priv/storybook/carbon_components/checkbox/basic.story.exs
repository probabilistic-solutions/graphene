defmodule Storybook.CarbonComponents.Checkbox.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.checkbox_group/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{legend_text: "Notifications"},
        slots: [
          ~S|<:item label="Email" value="email" />
<:item label="SMS" value="sms" />|
        ]
      },
      %Variation{
        id: :with_checked,
        attributes: %{legend_text: "Status"},
        slots: [
          ~S|<:item label="Active" value="active" checked={true} />
<:item label="Paused" value="paused" />|
        ]
      },
      %Variation{
        id: :invalid,
        attributes: %{
          legend_text: "Required",
          invalid: true,
          invalid_text: "Select at least one"
        },
        slots: [
          ~S|<:item label="Option A" value="a" />
<:item label="Option B" value="b" />|
        ]
      }
    ]
  end
end

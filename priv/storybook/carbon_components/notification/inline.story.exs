defmodule Storybook.CarbonComponents.Notification.Inline do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.inline_notification/1

  def variations do
    [
      %Variation{
        id: :info,
        attributes: %{kind: "info"},
        slots: [
          ~S|<:title>Updates available</:title>
<:subtitle>Refresh to install the latest changes</:subtitle>|
        ]
      },
      %Variation{
        id: :warning,
        attributes: %{kind: "warning"},
        slots: [
          ~S|<:title>Storage almost full</:title>
<:subtitle>Clean up old files</:subtitle>|
        ]
      },
      %Variation{
        id: :success,
        attributes: %{kind: "success"},
        slots: [
          ~S|<:title>Saved</:title>
<:subtitle>Your changes were saved</:subtitle>|
        ]
      }
    ]
  end
end

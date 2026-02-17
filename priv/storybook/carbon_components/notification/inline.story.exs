defmodule Storybook.CarbonComponents.Notification.Inline do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.inline_notification/1

  def variations do
    [
      %Variation{
        id: :info,
        attributes: %{title: "Updates available", subtitle: "Refresh to install the latest changes", kind: "info"}
      },
      %Variation{
        id: :warning,
        attributes: %{title: "Storage almost full", subtitle: "Clean up old files", kind: "warning"}
      },
      %Variation{
        id: :success,
        attributes: %{title: "Saved", subtitle: "Your changes were saved", kind: "success"}
      }
    ]
  end
end

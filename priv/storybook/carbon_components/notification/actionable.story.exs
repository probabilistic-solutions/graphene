defmodule Storybook.CarbonComponents.Notification.Actionable do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.actionable_notification/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{title: "Backup completed", subtitle: "View the report for details", action_button_label: "View report"}
      },
      %Variation{
        id: :warning,
        attributes: %{title: "Storage almost full", subtitle: "Upgrade or remove files", action_button_label: "Manage", kind: "warning"}
      },
      %Variation{
        id: :error,
        attributes: %{title: "Sync failed", subtitle: "Retry the sync", action_button_label: "Retry", kind: "error"}
      }
    ]
  end
end

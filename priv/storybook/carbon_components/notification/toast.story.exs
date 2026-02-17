defmodule Storybook.CarbonComponents.Notification.Toast do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.toast_notification/1

  def variations do
    [
      %Variation{
        id: :success,
        attributes: %{title: "Saved", subtitle: "Your changes were saved", kind: "success", timeout: "3000"}
      },
      %Variation{
        id: :info,
        attributes: %{title: "New message", subtitle: "You have unread messages", kind: "info", timeout: "5000"}
      },
      %Variation{
        id: :error,
        attributes: %{title: "Failed", subtitle: "Try again", kind: "error", timeout: "3000"}
      }
    ]
  end
end

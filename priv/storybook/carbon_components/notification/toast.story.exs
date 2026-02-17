defmodule Storybook.CarbonComponents.Notification.Toast do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.toast_notification/1

  def variations do
    [
      %Variation{
        id: :success,
        attributes: %{kind: "success", timeout: "3000"},
        slots: [
          ~S|<:title>Saved</:title>
<:subtitle>Your changes were saved</:subtitle>|
        ]
      },
      %Variation{
        id: :info,
        attributes: %{kind: "info", timeout: "5000"},
        slots: [
          ~S|<:title>New message</:title>
<:subtitle>You have unread messages</:subtitle>|
        ]
      },
      %Variation{
        id: :error,
        attributes: %{kind: "error", timeout: "3000"},
        slots: [
          ~S|<:title>Failed</:title>
<:subtitle>Try again</:subtitle>|
        ]
      }
    ]
  end
end

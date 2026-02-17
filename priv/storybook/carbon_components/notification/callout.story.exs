defmodule Storybook.CarbonComponents.Notification.Callout do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.callout_notification/1

  def variations do
    [
      %Variation{
        id: :warning,
        attributes: %{title: "Plan limit reached", subtitle: "Upgrade to continue", kind: "warning"}
      },
      %Variation{
        id: :success,
        attributes: %{title: "Payment received", subtitle: "Your invoice is paid", kind: "success"}
      },
      %Variation{
        id: :error,
        attributes: %{title: "Payment failed", subtitle: "Update your card", kind: "error"}
      }
    ]
  end
end

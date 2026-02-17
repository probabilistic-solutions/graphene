defmodule Storybook.CarbonComponents.Notification.Callout do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.callout_notification/1

  def variations do
    [
      %Variation{
        id: :warning,
        attributes: %{kind: "warning"},
        slots: [
          ~S|<:title>Plan limit reached</:title>
<:subtitle>Upgrade to continue</:subtitle>|
        ]
      },
      %Variation{
        id: :success,
        attributes: %{kind: "success"},
        slots: [
          ~S|<:title>Payment received</:title>
<:subtitle>Your invoice is paid</:subtitle>|
        ]
      },
      %Variation{
        id: :error,
        attributes: %{kind: "error"},
        slots: [
          ~S|<:title>Payment failed</:title>
<:subtitle>Update your card</:subtitle>|
        ]
      }
    ]
  end
end

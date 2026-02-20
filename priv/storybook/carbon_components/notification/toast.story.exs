defmodule Storybook.CarbonComponents.Notification.Toast do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.toast_notification/1

  def doc do
    Storybook.Doc.markdown("""
Toast notifications are brief, time-based messages that appear outside the flow.
Use them for global feedback like success or background completion.

Pair .toast_notification with succinct copy and avoid stacking too many at once.
""")
  end

  

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

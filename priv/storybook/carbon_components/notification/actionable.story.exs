defmodule Storybook.CarbonComponents.Notification.Actionable do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.actionable_notification/1

  def doc do
    Storybook.Doc.markdown("""
Actionable notifications include buttons for immediate follow-up actions. Use
them when a status message requires user input.

Pair .actionable_notification with relevant .button actions and keep the message
short to avoid overwhelming the page.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{action_button_label: "View report"},
        slots: [
          ~S|<:title>Backup completed</:title>
<:subtitle>View the report for details</:subtitle>|
        ]
      },
      %Variation{
        id: :warning,
        attributes: %{action_button_label: "Manage", kind: "warning"},
        slots: [
          ~S|<:title>Storage almost full</:title>
<:subtitle>Upgrade or remove files</:subtitle>|
        ]
      },
      %Variation{
        id: :error,
        attributes: %{action_button_label: "Retry", kind: "error"},
        slots: [
          ~S|<:title>Sync failed</:title>
<:subtitle>Retry the sync</:subtitle>|
        ]
      }
    ]
  end
end

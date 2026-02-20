defmodule Storybook.CarbonComponents.Notification.Inline do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.inline_notification/1

  def doc do
    Storybook.Doc.markdown("""
Inline notifications appear within the task flow and reflect the status of an
action. Use them near the related content or form section.

Pair .inline_notification with .form validation messages or table actions to
keep feedback contextual.
""")
  end

  

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

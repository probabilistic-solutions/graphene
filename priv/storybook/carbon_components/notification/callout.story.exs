defmodule Storybook.CarbonComponents.Notification.Callout do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.callout_notification/1

  def doc do
    Storybook.Doc.markdown("""
Callout notifications highlight important, non-dismissible information that is
part of the page content. Use them to surface critical context at load time.

Pair .callout_notification with related content sections and keep the placement
close to the affected area.
""")
  end

  

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

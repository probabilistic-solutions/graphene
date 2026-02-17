defmodule Storybook.CarbonComponents.TimePicker.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.time_picker/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{value: "12:00"},
        slots: [
          ~S|<:s-label-text>Start time</:s-label-text>
<:select_item value="UTC" selected>UTC</:select_item>
<:select_item value="PST">PST</:select_item>|
        ]
      },
      %Variation{
        id: :with_timezone,
        attributes: %{value: "09:30"},
        slots: [
          ~S|<:s-label-text>Meeting time</:s-label-text>
<:select_item value="UTC" selected>UTC</:select_item>
<:select_item value="CET">CET</:select_item>|
        ]
      },
      %Variation{
        id: :invalid,
        attributes: %{value: "", invalid: true, invalid_text: "Enter a time"},
        slots: [
          ~S|<:s-label-text>Start time</:s-label-text>
<:select_item value="UTC" selected>UTC</:select_item>|
        ]
      }
    ]
  end
end

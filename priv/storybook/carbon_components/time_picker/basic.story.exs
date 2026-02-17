defmodule Storybook.CarbonComponents.TimePicker.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.time_picker/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{name: "time-picker-default", value: "12:00"},
        slots: [
          ~S|<:label_text>Start time</:label_text>
<:select_item value="UTC" selected>UTC</:select_item>
<:select_item value="PST">PST</:select_item>|
        ]
      },
      %Variation{
        id: :with_timezone,
        attributes: %{name: "time-picker-timezone", value: "09:30"},
        slots: [
          ~S|<:label_text>Meeting time</:label_text>
<:select_item value="UTC" selected>UTC</:select_item>
<:select_item value="CET">CET</:select_item>|
        ]
      },
      %Variation{
        id: :invalid,
        attributes: %{name: "time-picker-invalid", value: "", invalid: true, invalid_text: "Enter a time"},
        slots: [
          ~S|<:label_text>Start time</:label_text>
<:select_item value="UTC" selected>UTC</:select_item>|
        ]
      }
    ]
  end
end

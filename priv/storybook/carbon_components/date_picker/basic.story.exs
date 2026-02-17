defmodule Storybook.CarbonComponents.DatePicker.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.date_picker/1

  def variations do
    [
      %Variation{
        id: :single,
        attributes: %{name: "date-picker-single"},
        slots: [
          ~S|<:input label="Start date" placeholder="mm/dd/yyyy" />|
        ]
      },
      %Variation{
        id: :range,
        attributes: %{name: "date-picker-range", value: "2024-01-10/2024-01-14"},
        slots: [
          ~S|<:input label="Start" placeholder="mm/dd/yyyy" />
<:input label="End" placeholder="mm/dd/yyyy" />|
        ]
      },
      %Variation{
        id: :disabled,
        attributes: %{name: "date-picker-disabled", disabled: true},
        slots: [
          ~S|<:input label="Disabled" placeholder="mm/dd/yyyy" disabled={true} />|
        ]
      }
    ]
  end
end

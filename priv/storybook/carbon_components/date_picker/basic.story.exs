defmodule Storybook.CarbonComponents.DatePicker.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.date_picker/1

  def variations do
    [
      %Variation{
        id: :single,
        attributes: %{name: "date-picker-single", date_format: "d/m/Y"},
        slots: [
          ~S|<:input label="Start date" placeholder="dd/mm/yyyy" />|
        ]
      },
      %Variation{
        id: :range,
        attributes: %{name: "date-picker-range", value: "2024-01-10/2024-01-14", date_format: "d/m/Y"},
        slots: [
          ~S|<:input label="Start" placeholder="dd/mm/yyyy" />
<:input label="End" placeholder="dd/mm/yyyy" />|
        ]
      },
      %Variation{
        id: :disabled,
        attributes: %{name: "date-picker-disabled", disabled: true, date_format: "d/m/Y"},
        slots: [
          ~S|<:input label="Disabled" placeholder="dd/mm/yyyy" disabled={true} />|
        ]
      }
    ]
  end
end

defmodule Storybook.CarbonComponents.FluidTimePicker.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.fluid_time_picker/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{name: "fluid-time-picker-default", value: "12:00"},
        slots: [
          ~S|<:label_text>Start time</:label_text>
<:time_picker_select>
  <Graphene.CarbonComponents.fluid_time_picker_select>
    <Graphene.CarbonComponents.select_item value="UTC" selected>UTC</Graphene.CarbonComponents.select_item>
    <Graphene.CarbonComponents.select_item value="PST">PST</Graphene.CarbonComponents.select_item>
  </Graphene.CarbonComponents.fluid_time_picker_select>
</:time_picker_select>|
        ]
      },
      %Variation{
        id: :with_timezone,
        attributes: %{name: "fluid-time-picker-timezone", value: "09:30"},
        slots: [
          ~S|<:label_text>Meeting time</:label_text>
<:time_picker_select>
  <Graphene.CarbonComponents.fluid_time_picker_select>
    <Graphene.CarbonComponents.select_item value="UTC" selected>UTC</Graphene.CarbonComponents.select_item>
    <Graphene.CarbonComponents.select_item value="CET">CET</Graphene.CarbonComponents.select_item>
  </Graphene.CarbonComponents.fluid_time_picker_select>
</:time_picker_select>|
        ]
      },
      %Variation{
        id: :invalid,
        attributes: %{
          name: "fluid-time-picker-invalid",
          value: "",
          invalid: true,
          invalid_text: "Enter a time"
        },
        slots: [
          ~S|<:label_text>Start time</:label_text>
<:time_picker_select>
  <Graphene.CarbonComponents.fluid_time_picker_select>
    <Graphene.CarbonComponents.select_item value="UTC" selected>UTC</Graphene.CarbonComponents.select_item>
  </Graphene.CarbonComponents.fluid_time_picker_select>
</:time_picker_select>|
        ]
      }
    ]
  end
end

defmodule Storybook.CarbonComponents.Textarea.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.textarea/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{rows: "3"},
        slots: [
          ~S|<:s-label-text>Notes</:s-label-text>|
        ]
      },
      %Variation{
        id: :helper_text,
        attributes: %{rows: "4"},
        slots: [
          ~S|<:s-label-text>Description</:s-label-text>
<:s-helper-text>Max 300 characters</:s-helper-text>|
        ]
      },
      %Variation{
        id: :invalid,
        attributes: %{rows: "3", invalid: true, invalid_text: "Required"},
        slots: [
          ~S|<:s-label-text>Reason</:s-label-text>|
        ]
      }
    ]
  end
end

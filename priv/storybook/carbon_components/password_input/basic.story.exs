defmodule Storybook.CarbonComponents.PasswordInput.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.password_input/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          ~S|<:s-label-text>Password</:s-label-text>|
        ]
      },
      %Variation{
        id: :helper_text,
        slots: [
          ~S|<:s-label-text>New password</:s-label-text>
<:s-helper-text>Minimum 8 characters</:s-helper-text>|
        ]
      },
      %Variation{
        id: :invalid,
        attributes: %{invalid: true, invalid_text: "Required"},
        slots: [
          ~S|<:s-label-text>Password</:s-label-text>|
        ]
      }
    ]
  end
end

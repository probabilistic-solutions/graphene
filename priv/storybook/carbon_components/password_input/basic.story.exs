defmodule Storybook.CarbonComponents.PasswordInput.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.password_input/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{name: "password-input-default"},
        slots: [
          ~S|<:label_text>Password</:label_text>|
        ]
      },
      %Variation{
        id: :helper_text,
        attributes: %{name: "password-input-helper"},
        slots: [
          ~S|<:label_text>New password</:label_text>
<:helper_text>Minimum 8 characters</:helper_text>|
        ]
      },
      %Variation{
        id: :invalid,
        attributes: %{name: "password-input-invalid", invalid: true, invalid_text: "Required"},
        slots: [
          ~S|<:label_text>Password</:label_text>|
        ]
      }
    ]
  end
end

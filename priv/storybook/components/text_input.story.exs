defmodule Storybook.CoreComponents.TextInput do
  use PhoenixStorybook.Story, :component
  use Graphene, [:html, :live]

  def function, do: &Graphene.Internal.CoreComponents.text_input/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: ["Inner Content"]
      },
      %Variation{
        id: :placeholder,
        attributes: %{
          placeholder: "Placeholder Text"
        }
      },
      %VariationGroup{
        id: :types,
        variations:
          for type <- ~w(text email password tel url) do
            %Variation{
              id: String.to_atom(type),
              attributes: %{
                type: type,
                value: String.capitalize(type)
              }
            }
          end
      },
      %Variation{
        id: :disabled,
        attributes: %{
          disabled: true,
          value: "Disabled"
        }
      },
      %Variation{
        id: :readonly,
        attributes: %{
          readonly: true,
          value: "Readonly"
        }
      },
      %Variation{
        id: :with_helper_text,
        attributes: %{
          value: "Help me"
        },
        slots: [~S|<:helper_text>This is some helper text.</:helper_text>|]
      },
      %Variation{
        id: :with_counter,
        attributes: %{
          enable_counter: true,
          max_count: 100,
          value: "Text is counted"
        }
      },
      %VariationGroup{
        id: :size,
        variations:
          for type <- ~w(size_sm size_md size_lg size_xl)a do
            size = to_string(type) |> String.replace("size_", "")

            %Variation{
              id: type,
              attributes: %{
                size: size,
                value: String.capitalize(size)
              }
            }
          end
      },
      %Variation{
        id: :password,
        attributes: %{
          type: "password",
          show_password_visibility_toggle: true,
          value: "strong password"
        }
      },
      %Variation{
        id: :invalid,
        attributes: %{
          invalid: true,
          invalid_text: "This field is required.",
          value: "Invalid"
        }
      },
      %Variation{
        id: :warning,
        attributes: %{
          warn: true,
          warn_text: "This is a warning message.",
          value: "I'm doing wrong"
        }
      }
    ]
  end
end

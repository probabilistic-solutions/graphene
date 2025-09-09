defmodule Storybook.CoreComponents.Button do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CoreComponents.button/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: ["Button"]
      },
      %VariationGroup{
        id: :common,
        variations:
          for type <- [:primary, :secondary, :tertiary, :ghost] do
            %Variation{
              id: type,
              attributes: %{
                kind: to_string(type)
              },
              slots: [String.capitalize("#{type}") |> String.replace("--", " ")]
            }
          end
      },
      %VariationGroup{
        id: :danger,
        variations:
          for type <- [:danger, :"danger--tertiary", :"danger--ghost"] do
            %Variation{
              id: type,
              attributes: %{
                kind: to_string(type)
              },
              slots: [String.capitalize("#{type}") |> String.replace("--", " ")]
            }
          end
      },
      %VariationGroup{
        id: :size,
        variations:
          for type <- ~w(size_sm size_md size_lg size_xl size_2xl)a do
            size = to_string(type) |> String.replace("size_", "")

            %Variation{
              id: type,
              attributes: %{
                size: size
              },
              slots: [size |> String.capitalize()]
            }
          end
      },
      %Variation{
        id: :disabled,
        attributes: %{
          disabled: true
        },
        slots: ["Disabled"]
      },
      %Variation{
        id: :icon,
        slots: [~S|<:s-icon><Graphene.Icons.icon fit="width" name="arrow--right" /></:s-icon>|]
      },
      %Variation{
        id: :"icon-text",
        attributes: %{
          has_main_content: true
        },
        slots: [
          ~S|Text <:s-icon><Graphene.Icons.icon fit="width" name="arrow--right" slot="icon" /></:s-icon>|
        ]
      },
      %Variation{
        id: :tooltip,
        attributes: %{
          tooltip_text: "help message"
        },
        slots: [
          ~S|<:s-icon><Graphene.Icons.icon fit="width" name="help-desk" slot="icon"/></:s-icon>|
        ]
      },
      %VariationGroup{
        id: :"expressive-icon",
        variations: [
          %Variation{
            id: :"not-expressive",
            attributes: %{
              tooltip_text: "expressive false",
              is_expressive: false
            },
            slots: [~S|<:s-icon><Graphene.Icons.icon fit="width" name="analytics"/></:s-icon>|]
          },
          %Variation{
            id: :expressive,
            attributes: %{
              tooltip_text: "expressive true",
              is_expressive: true
            },
            slots: [~S|<:s-icon><Graphene.Icons.icon fit="width" name="analytics"/></:s-icon>|]
          }
        ]
      },
      %VariationGroup{
        id: :"expressive-text",
        variations: [
          %Variation{
            id: :"not-expressive",
            attributes: %{
              is_expressive: false
            },
            slots: [~S|Default|]
          },
          %Variation{
            id: :expressive,
            attributes: %{
              is_expressive: true
            },
            slots: [~S|Expressive|]
          }
        ]
      }
    ]
  end
end

defmodule Storybook.CarbonComponents.ChatButton do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.chat_button/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: ["Start chat"]
      },
      %Variation{
        id: :quick_action,
        attributes: %{is_quick_action: true},
        slots: ["Quick action"]
      },
      %Variation{
        id: :selected,
        attributes: %{is_quick_action: true, is_selected: true},
        slots: ["Selected"]
      },
      %VariationGroup{
        id: :sizes,
        variations:
          for size <- ~w(sm md lg) do
            %Variation{
              id: String.to_atom(size),
              attributes: %{size: size},
              slots: ["Chat button"]
            }
          end
      }
    ]
  end
end

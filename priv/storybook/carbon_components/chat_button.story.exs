defmodule Storybook.CarbonComponents.ChatButton do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.chat_button/1

  def doc do
    Storybook.Doc.markdown("""
Chat buttons provide quick access to help or support without interrupting the
main task flow. Use them for optional assistance rather than primary actions.

Pair .chat_button with a .popover or .modal chat surface and keep it visually
separate from primary .button actions.
""")
  end

  

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
        description: "Size variants",
        note: "Use sm in compact headers and lg for prominent entry points.",
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

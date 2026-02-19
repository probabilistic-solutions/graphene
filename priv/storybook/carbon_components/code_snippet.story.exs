defmodule Storybook.CarbonComponents.CodeSnippet do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.code_snippet/1

  def doc do
    Storybook.Doc.markdown("""
Code snippets present short, copyable commands or tokens. Use them in setup
flows and documentation when users need to paste values quickly.

Pair .code_snippet with .copy_button and place it near explanatory .text or
.link guidance.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :single,
        attributes: %{type: "single"},
        slots: ["npm install graphene"]
      },
      %Variation{
        id: :inline,
        attributes: %{type: "inline"},
        slots: ["mix test"]
      },
      %Variation{
        id: :multi,
        attributes: %{type: "multi"},
        slots: [
          "mix graphene.generate"
        ]
      },
      %Variation{
        id: :wrapped,
        attributes: %{type: "single", wrap_text: true},
        slots: ["npm install graphene --save"]
      }
    ]
  end
end

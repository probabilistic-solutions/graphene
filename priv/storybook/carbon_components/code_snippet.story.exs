defmodule Storybook.CarbonComponents.CodeSnippet do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.code_snippet/1

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

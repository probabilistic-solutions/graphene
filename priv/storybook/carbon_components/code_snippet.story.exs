defmodule Storybook.CarbonComponents.CodeSnippet do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.code_snippet/1

  def variations do
    [
      %Variation{
        id: :single,
        attributes: %{type: "single", copy_text: "npm install graphene"},
        slots: ["npm install graphene"]
      },
      %Variation{
        id: :inline,
        attributes: %{type: "inline", copy_text: "mix test"},
        slots: ["mix test"]
      },
      %Variation{
        id: :multi,
        attributes: %{
          type: "multi",
          copy_text: "mix graphene.core_components.generate\nmix graphene.stories.generate"
        },
        slots: [
          "mix graphene.core_components.generate\nmix graphene.stories.generate"
        ]
      },
      %Variation{
        id: :wrapped,
        attributes: %{type: "single", wrap_text: true, copy_text: "npm install graphene --save"},
        slots: ["npm install graphene --save"]
      }
    ]
  end
end

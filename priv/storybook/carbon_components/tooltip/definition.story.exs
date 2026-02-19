defmodule Storybook.CarbonComponents.Tooltip.Definition do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.definition_tooltip/1

  def doc do
    Storybook.Doc.markdown("""
Definition tooltips explain terms inline without disrupting reading. Use them in
dense text where definitions should stay close to the term.

Pair .definition_tooltip with inline .link styles and keep the definition short.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :default,
        slots: ["Tooltip"]
      },
      %Variation{
        id: :short,
        slots: ["AI"]
      },
      %Variation{
        id: :long,
        slots: ["Confidence score"]
      }
    ]
  end
end

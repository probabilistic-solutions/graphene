defmodule Storybook.CarbonComponents.Heading do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.heading/1

  def doc do
    Storybook.Doc.markdown("""
Headings establish hierarchy and section structure. Use them to label sections
and provide scannable anchors for content.

Pair .heading with .page_header, .tile, or .contained_list to create clear
content groupings.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :default,
        slots: ["Section heading"]
      },
      %Variation{
        id: :short,
        slots: ["Overview"]
      },
      %Variation{
        id: :long,
        slots: ["Project timeline and deliverables"]
      }
    ]
  end
end

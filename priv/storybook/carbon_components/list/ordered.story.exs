defmodule Storybook.CarbonComponents.List.Ordered do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.ordered_list/1

  def doc do
    Storybook.Doc.markdown("""
Ordered lists are for step-by-step sequences where order matters. Use them for
procedures, instructions, or ranked items.

Pair .ordered_list with .heading or .link elements to provide context for steps.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          ~S|<:item>First item</:item>
<:item>Second item</:item>
<:item>Third item</:item>|
        ]
      },
      %Variation{
        id: :native,
        attributes: %{native: true},
        slots: [
          ~S|<:item>Step one</:item>
<:item>Step two</:item>|
        ]
      },
      %Variation{
        id: :expressive,
        attributes: %{is_expressive: true},
        slots: [
          ~S|<:item>Expressive one</:item>
<:item>Expressive two</:item>|
        ]
      }
    ]
  end
end

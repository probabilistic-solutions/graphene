defmodule Storybook.CarbonComponents.List.Unordered do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.unordered_list/1

  def doc do
    Storybook.Doc.markdown("""
Unordered lists group related items where order does not matter. Use them to
summarize features, requirements, or related links.

Combine .unordered_list with .link or .tag elements for quick scanning.
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
        id: :nested,
        attributes: %{nested: true},
        slots: [
          ~S|<:item>Outer item</:item>
<:item>Another item</:item>|
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

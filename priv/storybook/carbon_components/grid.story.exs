defmodule Storybook.CarbonComponents.Grid do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.grid/1

  def doc do
    Storybook.Doc.markdown("""
The Carbon grid provides a 2x spacing-based layout system. Use .grid and
:column slots to align content to the 16-column grid.

Combine .grid with .ui_shell content and use row_gap to control vertical rhythm
between sections.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :default,
        note:
          "Use a top-level `<Graphene.CarbonComponents.grid full_width>` inside UI shell content so sections align to the Carbon grid. Control vertical rhythm with `row_gap`.",
        slots: [
          ~S|<:column sm="2">Column 1</:column>
<:column sm="2">Column 2</:column>
<:column sm="2">Column 3</:column>|
        ]
      },
      %Variation{
        id: :condensed,
        attributes: %{condensed: true},
        slots: [
          ~S|<:column sm="1">One</:column>
<:column sm="1">Two</:column>
<:column sm="1">Three</:column>
<:column sm="1">Four</:column>|
        ]
      },
      %Variation{
        id: :full_width,
        attributes: %{full_width: true},
        slots: [
          ~S|<:column sm="2">Wide 1</:column>
<:column sm="2">Wide 2</:column>
<:column sm="2">Wide 3</:column>|
        ]
      }
    ]
  end
end

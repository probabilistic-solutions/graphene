defmodule Storybook.CarbonComponents.Grid do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.grid/1

  def variations do
    [
      %Variation{
        id: :default,
        note:
          "Use a top-level `<.grid full_width>` inside UI shell content so sections align to the Carbon grid. Control vertical rhythm with `row_gap`.",
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

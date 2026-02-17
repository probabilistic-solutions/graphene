defmodule Storybook.CarbonComponents.Icon do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.icon/1

  def variations do
    [
      %Variation{
        id: :circle_16,
        attributes: %{size: "16"},
        slots: [
          ~S|<svg width="16" height="16" viewBox="0 0 16 16">
  <circle cx="8" cy="8" r="6" fill="currentColor" />
</svg>|
        ]
      },
      %Variation{
        id: :square_20,
        attributes: %{size: "20"},
        slots: [
          ~S|<svg width="20" height="20" viewBox="0 0 20 20">
  <rect x="3" y="3" width="14" height="14" fill="currentColor" />
</svg>|
        ]
      },
      %Variation{
        id: :triangle_32,
        attributes: %{size: "32"},
        slots: [
          ~S|<svg width="32" height="32" viewBox="0 0 32 32">
  <polygon points="16,4 28,28 4,28" fill="currentColor" />
</svg>|
        ]
      }
    ]
  end
end

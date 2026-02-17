defmodule Storybook.CarbonComponents.IconButton do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.icon_button/1

  def variations do
    [
      %Variation{
        id: :ghost,
        attributes: %{kind: "ghost", tooltip_text: "Settings"},
        slots: [
          ~S|<Graphene.CarbonComponents.icon size="16">
  <svg width="16" height="16" viewBox="0 0 16 16">
    <circle cx="8" cy="8" r="6" fill="currentColor" />
  </svg>
</Graphene.CarbonComponents.icon>|
        ]
      },
      %Variation{
        id: :primary,
        attributes: %{kind: "primary", tooltip_text: "Notifications"},
        slots: [
          ~S|<Graphene.CarbonComponents.icon size="16">
  <svg width="16" height="16" viewBox="0 0 16 16">
    <rect x="2" y="2" width="12" height="12" fill="currentColor" />
  </svg>
</Graphene.CarbonComponents.icon>|
        ]
      },
      %Variation{
        id: :danger,
        attributes: %{kind: "danger", tooltip_text: "Delete"},
        slots: [
          ~S|<Graphene.CarbonComponents.icon size="16">
  <svg width="16" height="16" viewBox="0 0 16 16">
    <polygon points="8,2 14,14 2,14" fill="currentColor" />
  </svg>
</Graphene.CarbonComponents.icon>|
        ]
      }
    ]
  end
end

defmodule Storybook.BasicComponents.Header do
  use PhoenixStorybook.Story, :component
  use Graphene, [:html, :live]

  def function, do: &Graphene.BasicComponents.header/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          ~S|<:name prefix="IBM" href="#">Nimbus Cloud</:name>|,
          ~S|<:global><Graphene.CarbonComponents.header_global_action button_label_inactive="Search" button_label_active="Search"><:icon><Graphene.CarbonComponents.icon name="search" size="20" /></:icon></Graphene.CarbonComponents.header_global_action></:global>|,
          ~S|<Graphene.CarbonComponents.header_nav menu_bar_label="IBM Nimbus Cloud"><Graphene.CarbonComponents.header_nav_item href="#">Overview</Graphene.CarbonComponents.header_nav_item></Graphene.CarbonComponents.header_nav>|
        ]
      }
    ]
  end
end

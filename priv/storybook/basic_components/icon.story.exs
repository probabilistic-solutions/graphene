defmodule Storybook.BasicComponents.Icon do
  use PhoenixStorybook.Story, :component
  alias PhoenixStorybook.Stories.Attr

  def function, do: &Graphene.BasicComponents.icon/1

  @hero_icons ~w(hero-information-circle hero-exclamation-circle hero-x-mark hero-arrow-path)

  def attributes do
    [
      %Attr{
        id: :name,
        type: :string,
        required: true,
        values: Graphene.Icons.available_icons() ++ @hero_icons
      },
      %Attr{id: :size, type: :integer, default: 20, values: [16, 20, 24, 32]}
    ]
  end

  def variations do
    [
      %Variation{
        id: :carbon,
        attributes: %{name: "add", size: 20}
      },
      %Variation{
        id: :hero_compat,
        attributes: %{name: "hero-x-mark", size: 20}
      }
    ]
  end
end

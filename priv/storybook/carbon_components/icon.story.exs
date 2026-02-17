defmodule Storybook.CarbonComponents.Icon do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.icon/1

  def variations do
    [
      %Variation{
        id: :cursor_16,
        attributes: %{name: "3d-cursor", size: "16"}
      },
      %Variation{
        id: :add_20,
        attributes: %{name: "add", size: "20"}
      },
      %Variation{
        id: :account_32,
        attributes: %{name: "account", size: "32"}
      }
    ]
  end
end

defmodule Storybook.CarbonComponents.Icon do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.icon/1

  def doc do
    Storybook.Doc.markdown("""
Icons reinforce meaning and should be paired with text when possible. Use them
to support labels or indicate status, not as the only indicator.

Pair .icon with .button or .tag, and add .tooltip when an icon stands alone.
""")
  end

  

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

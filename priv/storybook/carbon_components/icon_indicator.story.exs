defmodule Storybook.CarbonComponents.IconIndicator do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.icon_indicator/1

  def doc do
    Storybook.Doc.markdown("""
Icon indicators provide compact status messages with a label and icon. Use them
to show state in dense layouts or dashboards.

Pair .icon_indicator with .tag or .structured_list to keep status information
scannable.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :failed,
        attributes: %{kind: "failed", label: "Failed"}
      },
      %Variation{
        id: :succeeded,
        attributes: %{kind: "succeeded", label: "Succeeded"}
      },
      %Variation{
        id: :informative,
        attributes: %{kind: "informative", label: "Informative"}
      },
      %Variation{
        id: :large,
        attributes: %{kind: "succeeded", label: "Large", size: "20"}
      }
    ]
  end
end

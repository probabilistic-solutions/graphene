defmodule Storybook.CarbonComponents.Tile do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.tile/1

  def doc do
    Storybook.Doc.markdown("""
Tiles group related content and actions in a compact surface. Use them for
dashboards, onboarding, or selectable options.

Pair .tile with .button, .link, and .tag to surface actions and metadata.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :default,
        slots: ["Basic tile"]
      },
      %Variation{
        id: :light,
        attributes: %{color_scheme: "light"},
        slots: ["Light tile"]
      },
      %Variation{
        id: :rounded,
        attributes: %{has_rounded_corners: true},
        slots: ["Rounded corners"]
      }
    ]
  end
end

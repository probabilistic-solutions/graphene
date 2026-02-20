defmodule Storybook.CarbonComponents.Loading do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.loading/1

  def doc do
    Storybook.Doc.markdown("""
Loading indicators show that work is in progress. Use them for short waits or
background tasks, and prefer skeletons for long or full-page loads.

Pair .loading with the affected area or action, and avoid blocking the entire
page when partial content can load.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :active,
        attributes: %{active: true, description: "Loading"}
      },
      %Variation{
        id: :inactive,
        attributes: %{active: false, description: "Idle"}
      },
      %Variation{
        id: :small,
        attributes: %{active: true, description: "Loading", size: "sm"}
      }
    ]
  end
end

defmodule Storybook.CarbonComponents.Skeleton.Icon do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.skeleton_icon/1

  def doc do
    Storybook.Doc.markdown("""
Skeleton icons reserve space for icons while content loads. Use them alongside
skeleton text or placeholders to avoid layout shift.

Replace with the final .icon once data is available.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :small,
        attributes: %{style: "width: 16px; height: 16px;"}
      },
      %Variation{
        id: :medium,
        attributes: %{style: "width: 24px; height: 24px;"}
      },
      %Variation{
        id: :large,
        attributes: %{style: "width: 32px; height: 32px;"}
      }
    ]
  end
end

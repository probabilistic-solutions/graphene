defmodule Storybook.CarbonComponents.Breadcrumb do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.breadcrumb/1

  def doc do
    Storybook.Doc.markdown("""
Breadcrumbs provide secondary navigation that reflects hierarchy and lets users
move up levels. Use them for experiences with three or more hierarchy levels.

Place .breadcrumb within a .page_header or below the .ui_shell header, and pair
with .tabs when sections share the same parent.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          ~S|<:item href="#">Home</:item>
<:item href="#">Catalog</:item>
<:item current>Current page</:item>|
        ]
      },
      %Variation{
        id: :no_trailing_slash,
        attributes: %{no_trailing_slash: true},
        slots: [
          ~S|<:item href="#">Home</:item>
<:item href="#">Library</:item>
<:item current>Components</:item>|
        ]
      },
      %Variation{
        id: :small,
        attributes: %{size: "sm"},
        slots: [
          ~S|<:item href="#">Home</:item>
<:item href="#">Docs</:item>
<:item current>Breadcrumb</:item>|
        ]
      }
    ]
  end
end

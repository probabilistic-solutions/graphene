defmodule Storybook.CarbonComponents.Link do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.StorybookAliases.carbon_link/1

  def doc do
    Storybook.Doc.markdown("""
Links are for navigation and inline references, not primary actions. Use them
within sentences or as secondary navigation elements.

Pair .link with .breadcrumb or .structured_list entries and reserve .button for
task actions.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :inline,
        attributes: %{href: "#"},
        slots: ["Inline link"]
      },
      %Variation{
        id: :external,
        attributes: %{href: "#", target: "_blank", rel: "noreferrer"},
        slots: ["External link"]
      },
      %Variation{
        id: :disabled,
        attributes: %{href: "#", disabled: true},
        slots: ["Disabled link"]
      }
    ]
  end
end

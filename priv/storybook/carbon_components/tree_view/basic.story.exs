defmodule Storybook.CarbonComponents.TreeView.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.tree_view/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{label: "Primary navigation"},
        slots: [
          ~S|<:node label="Products" is_expanded={true} id="products">
  <Graphene.CarbonComponents.tree_node label="Catalog" id="catalog" />
  <Graphene.CarbonComponents.tree_node label="Pricing" id="pricing" />
  <Graphene.CarbonComponents.tree_node label="Releases" id="releases" />
</:node>
<:node label="Teams" is_expanded={true} id="teams">
  <Graphene.CarbonComponents.tree_node label="Design" id="design" />
  <Graphene.CarbonComponents.tree_node label="Engineering" id="engineering" selected />
  <Graphene.CarbonComponents.tree_node label="Marketing" id="marketing" disabled />
</:node>
<:node label="Settings" id="settings" active />|
        ]
      },
      %Variation{
        id: :nested,
        attributes: %{label: "Workspace navigation"},
        slots: [
          ~S|<:node label="Projects" is_expanded={true} id="projects">
  <Graphene.CarbonComponents.tree_node label="Alpha" id="alpha" />
  <Graphene.CarbonComponents.tree_node label="Beta" id="beta" />
  <Graphene.CarbonComponents.tree_node label="Gamma" id="gamma" />
</:node>
<:node label="Analytics" is_expanded={true} id="analytics">
  <Graphene.CarbonComponents.tree_node label="Dashboards" id="dashboards" />
  <Graphene.CarbonComponents.tree_node label="Reports" id="reports" />
</:node>
<:node label="Settings" id="settings" />|
        ]
      },
      %Variation{
        id: :sizes,
        attributes: %{label: "Small tree", size: "sm"},
        slots: [
          ~S|<:node label="Favorites" is_expanded={true} id="favorites">
  <Graphene.CarbonComponents.tree_node label="Overview" id="overview" />
  <Graphene.CarbonComponents.tree_node label="Recently viewed" id="recent" />
</:node>
<:node label="Archive" id="archive" />|
        ]
      }
    ]
  end
end

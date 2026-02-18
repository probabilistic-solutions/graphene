defmodule Storybook.CodeGen.CoreComponents.Sidenavlink do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.side_nav_link/1,
    component_module: Graphene.CoreComponents,
    component_name: :side_nav_link
end

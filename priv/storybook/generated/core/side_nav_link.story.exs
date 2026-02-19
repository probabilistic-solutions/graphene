defmodule Storybook.CodeGen.CoreComponents.Sidenavlink do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.side_nav_link/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :side_nav_link
end

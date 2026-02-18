defmodule Storybook.CodeGen.CoreComponents.Sidenav do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.side_nav/1,
    component_module: Graphene.CoreComponents,
    component_name: :side_nav
end

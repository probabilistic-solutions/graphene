defmodule Storybook.CodeGen.CoreComponents.Sidenavdivider do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.side_nav_divider/1,
    component_module: Graphene.CoreComponents,
    component_name: :side_nav_divider
end

defmodule Storybook.CodeGen.CoreComponents.Sidenavmenu do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.side_nav_menu/1,
    component_module: Graphene.CoreComponents,
    component_name: :side_nav_menu
end

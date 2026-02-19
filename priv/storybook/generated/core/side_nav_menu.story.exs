defmodule Storybook.CodeGen.CoreComponents.Sidenavmenu do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.side_nav_menu/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :side_nav_menu
end

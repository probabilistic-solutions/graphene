defmodule Storybook.CodeGen.CoreComponents.Sidenavmenuitem do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.side_nav_menu_item/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :side_nav_menu_item
end

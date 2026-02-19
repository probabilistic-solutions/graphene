defmodule Storybook.CodeGen.CoreComponents.Sidenavitems do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.side_nav_items/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :side_nav_items
end

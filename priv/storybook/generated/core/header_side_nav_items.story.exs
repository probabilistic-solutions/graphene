defmodule Storybook.CodeGen.CoreComponents.Headersidenavitems do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.header_side_nav_items/1,
    component_module: Graphene.CoreComponents,
    component_name: :header_side_nav_items
end

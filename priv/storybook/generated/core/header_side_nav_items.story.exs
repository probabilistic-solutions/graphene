defmodule Storybook.CodeGen.CoreComponents.Headersidenavitems do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.header_side_nav_items/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :header_side_nav_items
end

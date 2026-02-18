defmodule Storybook.CodeGen.CoreComponents.Expandabletile do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.expandable_tile/1,
    component_module: Graphene.CoreComponents,
    component_name: :expandable_tile
end

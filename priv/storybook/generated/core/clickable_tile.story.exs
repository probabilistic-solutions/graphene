defmodule Storybook.CodeGen.CoreComponents.Clickabletile do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.clickable_tile/1,
    component_module: Graphene.CoreComponents,
    component_name: :clickable_tile
end

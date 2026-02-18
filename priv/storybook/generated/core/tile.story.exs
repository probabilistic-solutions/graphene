defmodule Storybook.CodeGen.CoreComponents.Tile do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.tile/1,
    component_module: Graphene.CoreComponents,
    component_name: :tile
end

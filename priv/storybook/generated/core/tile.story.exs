defmodule Storybook.CodeGen.CoreComponents.Tile do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.tile/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :tile
end

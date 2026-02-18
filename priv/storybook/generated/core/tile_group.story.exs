defmodule Storybook.CodeGen.CoreComponents.Tilegroup do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.tile_group/1,
    component_module: Graphene.CoreComponents,
    component_name: :tile_group
end

defmodule Storybook.CodeGen.CoreComponents.Tilegroup do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.tile_group/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :tile_group
end

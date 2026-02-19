defmodule Storybook.CodeGen.CoreComponents.Tileabovethefoldcontent do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.tile_above_the_fold_content/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :tile_above_the_fold_content
end

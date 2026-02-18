defmodule Storybook.CodeGen.CoreComponents.Tileabovethefoldcontent do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.tile_above_the_fold_content/1,
    component_module: Graphene.CoreComponents,
    component_name: :tile_above_the_fold_content
end

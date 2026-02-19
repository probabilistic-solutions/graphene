defmodule Storybook.CodeGen.CoreComponents.Tilebelowthefoldcontent do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.tile_below_the_fold_content/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :tile_below_the_fold_content
end

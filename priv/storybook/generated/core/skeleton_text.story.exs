defmodule Storybook.CodeGen.CoreComponents.Skeletontext do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.skeleton_text/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :skeleton_text
end

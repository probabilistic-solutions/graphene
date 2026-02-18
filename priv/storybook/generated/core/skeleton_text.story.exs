defmodule Storybook.CodeGen.CoreComponents.Skeletontext do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.skeleton_text/1,
    component_module: Graphene.CoreComponents,
    component_name: :skeleton_text
end

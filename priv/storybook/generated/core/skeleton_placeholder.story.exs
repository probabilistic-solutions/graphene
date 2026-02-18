defmodule Storybook.CodeGen.CoreComponents.Skeletonplaceholder do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.skeleton_placeholder/1,
    component_module: Graphene.CoreComponents,
    component_name: :skeleton_placeholder
end

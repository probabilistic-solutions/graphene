defmodule Storybook.CodeGen.CoreComponents.Skeletonicon do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.skeleton_icon/1,
    component_module: Graphene.CoreComponents,
    component_name: :skeleton_icon
end

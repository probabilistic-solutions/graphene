defmodule Storybook.CodeGen.CoreComponents.Skeletonicon do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.skeleton_icon/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :skeleton_icon
end

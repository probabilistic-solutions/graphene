defmodule Storybook.CodeGen.CoreComponents.Aiskeletonicon do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.ai_skeleton_icon/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :ai_skeleton_icon
end

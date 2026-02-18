defmodule Storybook.CodeGen.CoreComponents.Aiskeletonicon do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.ai_skeleton_icon/1,
    component_module: Graphene.CoreComponents,
    component_name: :ai_skeleton_icon
end

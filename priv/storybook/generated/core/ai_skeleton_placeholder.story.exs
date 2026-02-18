defmodule Storybook.CodeGen.CoreComponents.Aiskeletonplaceholder do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.ai_skeleton_placeholder/1,
    component_module: Graphene.CoreComponents,
    component_name: :ai_skeleton_placeholder
end

defmodule Storybook.CodeGen.CoreComponents.Aiskeletonplaceholder do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.ai_skeleton_placeholder/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :ai_skeleton_placeholder
end

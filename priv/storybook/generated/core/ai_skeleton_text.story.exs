defmodule Storybook.CodeGen.CoreComponents.Aiskeletontext do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.ai_skeleton_text/1,
    component_module: Graphene.CoreComponents,
    component_name: :ai_skeleton_text
end

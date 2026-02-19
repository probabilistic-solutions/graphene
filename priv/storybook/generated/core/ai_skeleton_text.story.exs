defmodule Storybook.CodeGen.CoreComponents.Aiskeletontext do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.ai_skeleton_text/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :ai_skeleton_text
end

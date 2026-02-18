defmodule Storybook.CodeGen.CoreComponents.Textareaskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.textarea_skeleton/1,
    component_module: Graphene.CoreComponents,
    component_name: :textarea_skeleton
end

defmodule Storybook.CodeGen.CoreComponents.Textareaskeleton do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.textarea_skeleton/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :textarea_skeleton
end

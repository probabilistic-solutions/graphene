defmodule Storybook.CodeGen.CoreComponents.Codesnippetskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.code_snippet_skeleton/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :code_snippet_skeleton
end

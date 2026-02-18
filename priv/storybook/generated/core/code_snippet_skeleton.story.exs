defmodule Storybook.CodeGen.CoreComponents.Codesnippetskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.code_snippet_skeleton/1,
    component_module: Graphene.CoreComponents,
    component_name: :code_snippet_skeleton
end

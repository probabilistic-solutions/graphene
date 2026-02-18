defmodule Storybook.CodeGen.CoreComponents.Codesnippet do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.code_snippet/1,
    component_module: Graphene.CoreComponents,
    component_name: :code_snippet
end

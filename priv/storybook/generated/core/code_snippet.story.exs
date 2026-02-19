defmodule Storybook.CodeGen.CoreComponents.Codesnippet do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.code_snippet/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :code_snippet
end

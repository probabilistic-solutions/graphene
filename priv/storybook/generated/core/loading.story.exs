defmodule Storybook.CodeGen.CoreComponents.Loading do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.loading/1,
    component_module: Graphene.CoreComponents,
    component_name: :loading
end

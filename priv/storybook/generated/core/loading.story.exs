defmodule Storybook.CodeGen.CoreComponents.Loading do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.loading/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :loading
end

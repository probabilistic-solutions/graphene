defmodule Storybook.CodeGen.CoreComponents.Layer do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.layer/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :layer
end

defmodule Storybook.CodeGen.CoreComponents.Layer do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.layer/1,
    component_module: Graphene.CoreComponents,
    component_name: :layer
end

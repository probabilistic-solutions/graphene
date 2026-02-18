defmodule Storybook.CodeGen.CoreComponents.Header do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.header/1,
    component_module: Graphene.CoreComponents,
    component_name: :header
end

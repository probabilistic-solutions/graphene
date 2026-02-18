defmodule Storybook.CodeGen.CoreComponents.Tearsheet do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.tearsheet/1,
    component_module: Graphene.CoreComponents,
    component_name: :tearsheet
end

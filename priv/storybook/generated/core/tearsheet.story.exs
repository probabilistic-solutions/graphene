defmodule Storybook.CodeGen.CoreComponents.Tearsheet do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.tearsheet/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :tearsheet
end

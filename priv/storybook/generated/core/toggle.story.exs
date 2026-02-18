defmodule Storybook.CodeGen.CoreComponents.Toggle do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.toggle/1,
    component_module: Graphene.CoreComponents,
    component_name: :toggle
end

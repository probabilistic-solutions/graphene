defmodule Storybook.CodeGen.CoreComponents.Button do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.button/1,
    component_module: Graphene.CoreComponents,
    component_name: :button
end

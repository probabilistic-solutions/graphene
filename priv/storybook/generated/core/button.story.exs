defmodule Storybook.CodeGen.CoreComponents.Button do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.button/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :button
end

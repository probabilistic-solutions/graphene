defmodule Storybook.CodeGen.CoreComponents.Stack do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.stack/1,
    component_module: Graphene.CoreComponents,
    component_name: :stack
end

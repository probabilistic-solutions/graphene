defmodule Storybook.CodeGen.CoreComponents.Copy do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.copy/1,
    component_module: Graphene.CoreComponents,
    component_name: :copy
end

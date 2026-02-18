defmodule Storybook.CodeGen.CoreComponents.Tab do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.tab/1,
    component_module: Graphene.CoreComponents,
    component_name: :tab
end

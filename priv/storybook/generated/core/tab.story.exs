defmodule Storybook.CodeGen.CoreComponents.Tab do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.tab/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :tab
end

defmodule Storybook.CodeGen.CoreComponents.Listitem do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.list_item/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :list_item
end

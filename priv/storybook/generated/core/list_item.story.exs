defmodule Storybook.CodeGen.CoreComponents.Listitem do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.list_item/1,
    component_module: Graphene.CoreComponents,
    component_name: :list_item
end

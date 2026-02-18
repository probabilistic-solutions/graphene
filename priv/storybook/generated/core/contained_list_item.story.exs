defmodule Storybook.CodeGen.CoreComponents.Containedlistitem do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.contained_list_item/1,
    component_module: Graphene.CoreComponents,
    component_name: :contained_list_item
end

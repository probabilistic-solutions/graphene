defmodule Storybook.CodeGen.CoreComponents.Containedlistitem do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.contained_list_item/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :contained_list_item
end

defmodule Storybook.CodeGen.CoreComponents.Selectitemgroup do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.select_item_group/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :select_item_group
end

defmodule Storybook.CodeGen.CoreComponents.Selectitemgroup do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.select_item_group/1,
    component_module: Graphene.CoreComponents,
    component_name: :select_item_group
end

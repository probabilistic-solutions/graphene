defmodule Storybook.CodeGen.CoreComponents.Multiselectitem do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.multi_select_item/1,
    component_module: Graphene.CoreComponents,
    component_name: :multi_select_item
end

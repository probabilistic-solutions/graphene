defmodule Storybook.CodeGen.CoreComponents.Selectitem do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.select_item/1,
    component_module: Graphene.CoreComponents,
    component_name: :select_item
end

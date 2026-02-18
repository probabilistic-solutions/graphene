defmodule Storybook.CodeGen.CoreComponents.Accordionitem do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.accordion_item/1,
    component_module: Graphene.CoreComponents,
    component_name: :accordion_item
end

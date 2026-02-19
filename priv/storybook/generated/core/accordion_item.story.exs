defmodule Storybook.CodeGen.CoreComponents.Accordionitem do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.accordion_item/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :accordion_item
end

defmodule Storybook.CodeGen.CoreComponents.Headernavitem do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.header_nav_item/1,
    component_module: Graphene.CoreComponents,
    component_name: :header_nav_item
end

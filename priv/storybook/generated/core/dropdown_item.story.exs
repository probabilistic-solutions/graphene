defmodule Storybook.CodeGen.CoreComponents.Dropdownitem do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.dropdown_item/1,
    component_module: Graphene.CoreComponents,
    component_name: :dropdown_item
end

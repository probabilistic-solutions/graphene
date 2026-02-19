defmodule Storybook.CodeGen.CoreComponents.Dropdownitem do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.dropdown_item/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :dropdown_item
end

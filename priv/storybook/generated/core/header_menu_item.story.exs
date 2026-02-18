defmodule Storybook.CodeGen.CoreComponents.Headermenuitem do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.header_menu_item/1,
    component_module: Graphene.CoreComponents,
    component_name: :header_menu_item
end

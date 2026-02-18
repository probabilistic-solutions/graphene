defmodule Storybook.CodeGen.CoreComponents.Overflowmenuitem do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.overflow_menu_item/1,
    component_module: Graphene.CoreComponents,
    component_name: :overflow_menu_item
end

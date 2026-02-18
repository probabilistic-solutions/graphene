defmodule Storybook.CodeGen.CoreComponents.Menuitem do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.menu_item/1,
    component_module: Graphene.CoreComponents,
    component_name: :menu_item
end

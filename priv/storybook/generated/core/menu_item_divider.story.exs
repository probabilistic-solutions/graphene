defmodule Storybook.CodeGen.CoreComponents.Menuitemdivider do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.menu_item_divider/1,
    component_module: Graphene.CoreComponents,
    component_name: :menu_item_divider
end

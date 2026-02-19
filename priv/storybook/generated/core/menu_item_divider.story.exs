defmodule Storybook.CodeGen.CoreComponents.Menuitemdivider do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.menu_item_divider/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :menu_item_divider
end

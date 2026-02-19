defmodule Storybook.CodeGen.CoreComponents.Menuitemgroup do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.menu_item_group/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :menu_item_group
end

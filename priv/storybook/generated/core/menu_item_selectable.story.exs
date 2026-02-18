defmodule Storybook.CodeGen.CoreComponents.Menuitemselectable do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.menu_item_selectable/1,
    component_module: Graphene.CoreComponents,
    component_name: :menu_item_selectable
end

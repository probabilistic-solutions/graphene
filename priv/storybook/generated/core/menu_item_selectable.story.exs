defmodule Storybook.CodeGen.CoreComponents.Menuitemselectable do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.menu_item_selectable/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :menu_item_selectable
end

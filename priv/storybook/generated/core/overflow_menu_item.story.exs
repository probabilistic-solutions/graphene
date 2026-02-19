defmodule Storybook.CodeGen.CoreComponents.Overflowmenuitem do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.overflow_menu_item/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :overflow_menu_item
end

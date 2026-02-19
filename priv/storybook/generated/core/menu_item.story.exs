defmodule Storybook.CodeGen.CoreComponents.Menuitem do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.menu_item/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :menu_item
end

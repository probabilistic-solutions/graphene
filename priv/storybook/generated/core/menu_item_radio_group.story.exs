defmodule Storybook.CodeGen.CoreComponents.Menuitemradiogroup do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.menu_item_radio_group/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :menu_item_radio_group
end

defmodule Storybook.CodeGen.CoreComponents.Comboboxitem do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.combo_box_item/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :combo_box_item
end

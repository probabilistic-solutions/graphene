defmodule Storybook.CodeGen.CoreComponents.Comboboxitem do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.combo_box_item/1,
    component_module: Graphene.CoreComponents,
    component_name: :combo_box_item
end

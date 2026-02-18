defmodule Storybook.CodeGen.CoreComponents.Combobox do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.combo_box/1,
    component_module: Graphene.CoreComponents,
    component_name: :combo_box
end

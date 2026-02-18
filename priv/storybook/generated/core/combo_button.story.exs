defmodule Storybook.CodeGen.CoreComponents.Combobutton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.combo_button/1,
    component_module: Graphene.CoreComponents,
    component_name: :combo_button
end

defmodule Storybook.CodeGen.CoreComponents.Combobutton do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.combo_button/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :combo_button
end

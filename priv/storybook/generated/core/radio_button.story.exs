defmodule Storybook.CodeGen.CoreComponents.Radiobutton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.radio_button/1,
    component_module: Graphene.CoreComponents,
    component_name: :radio_button
end

defmodule Storybook.CodeGen.CoreComponents.Radiobuttongroup do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.radio_button_group/1,
    component_module: Graphene.CoreComponents,
    component_name: :radio_button_group
end

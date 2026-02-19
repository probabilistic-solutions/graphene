defmodule Storybook.CodeGen.CoreComponents.Radiobuttongroup do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.radio_button_group/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :radio_button_group
end

defmodule Storybook.CodeGen.CoreComponents.Buttonsetbase do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.button_set_base/1,
    component_module: Graphene.CoreComponents,
    component_name: :button_set_base
end

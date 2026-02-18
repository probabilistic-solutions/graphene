defmodule Storybook.CodeGen.CoreComponents.Buttonset do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.button_set/1,
    component_module: Graphene.CoreComponents,
    component_name: :button_set
end

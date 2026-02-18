defmodule Storybook.CodeGen.CoreComponents.Modalbody do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.modal_body/1,
    component_module: Graphene.CoreComponents,
    component_name: :modal_body
end

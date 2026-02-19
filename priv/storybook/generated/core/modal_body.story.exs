defmodule Storybook.CodeGen.CoreComponents.Modalbody do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.modal_body/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :modal_body
end

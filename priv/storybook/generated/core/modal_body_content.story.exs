defmodule Storybook.CodeGen.CoreComponents.Modalbodycontent do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.modal_body_content/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :modal_body_content
end

defmodule Storybook.CodeGen.CoreComponents.Modalheader do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.modal_header/1,
    component_module: Graphene.CoreComponents,
    component_name: :modal_header
end

defmodule Storybook.CodeGen.CoreComponents.Modalheader do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.modal_header/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :modal_header
end

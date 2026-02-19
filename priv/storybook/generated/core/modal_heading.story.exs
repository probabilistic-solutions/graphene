defmodule Storybook.CodeGen.CoreComponents.Modalheading do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.modal_heading/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :modal_heading
end

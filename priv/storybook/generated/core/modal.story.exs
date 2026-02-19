defmodule Storybook.CodeGen.CoreComponents.Modal do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.modal/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :modal
end

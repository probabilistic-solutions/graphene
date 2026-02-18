defmodule Storybook.CodeGen.CoreComponents.Modal do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.modal/1,
    component_module: Graphene.CoreComponents,
    component_name: :modal
end

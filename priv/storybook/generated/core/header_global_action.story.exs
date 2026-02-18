defmodule Storybook.CodeGen.CoreComponents.Headerglobalaction do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.header_global_action/1,
    component_module: Graphene.CoreComponents,
    component_name: :header_global_action
end

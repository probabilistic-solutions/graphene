defmodule Storybook.CodeGen.CoreComponents.Headerglobalaction do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.header_global_action/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :header_global_action
end

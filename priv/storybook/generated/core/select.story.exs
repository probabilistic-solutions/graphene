defmodule Storybook.CodeGen.CoreComponents.Select do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.select/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :select
end

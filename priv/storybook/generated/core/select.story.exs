defmodule Storybook.CodeGen.CoreComponents.Select do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.select/1,
    component_module: Graphene.CoreComponents,
    component_name: :select
end

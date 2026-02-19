defmodule Storybook.CodeGen.CoreComponents.Toggle do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.toggle/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :toggle
end

defmodule Storybook.CodeGen.CoreComponents.Stack do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.stack/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :stack
end

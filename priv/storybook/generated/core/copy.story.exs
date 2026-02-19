defmodule Storybook.CodeGen.CoreComponents.Copy do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.copy/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :copy
end

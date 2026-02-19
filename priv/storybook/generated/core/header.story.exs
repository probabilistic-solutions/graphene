defmodule Storybook.CodeGen.CoreComponents.Header do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.header/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :header
end

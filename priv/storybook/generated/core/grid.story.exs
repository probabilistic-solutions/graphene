defmodule Storybook.CodeGen.CoreComponents.Grid do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.grid/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :grid
end

defmodule Storybook.CodeGen.CoreComponents.Grid do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.grid/1,
    component_module: Graphene.CoreComponents,
    component_name: :grid
end

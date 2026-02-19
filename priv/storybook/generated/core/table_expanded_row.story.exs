defmodule Storybook.CodeGen.CoreComponents.Tableexpandedrow do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.table_expanded_row/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :table_expanded_row
end

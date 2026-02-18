defmodule Storybook.CodeGen.CoreComponents.Tableexpandedrow do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.table_expanded_row/1,
    component_module: Graphene.CoreComponents,
    component_name: :table_expanded_row
end

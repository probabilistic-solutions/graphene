defmodule Storybook.CodeGen.CoreComponents.Tableheadercell do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.table_header_cell/1,
    component_module: Graphene.CoreComponents,
    component_name: :table_header_cell
end

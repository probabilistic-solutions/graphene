defmodule Storybook.CodeGen.CoreComponents.Tableheadercell do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.table_header_cell/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :table_header_cell
end

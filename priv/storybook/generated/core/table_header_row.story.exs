defmodule Storybook.CodeGen.CoreComponents.Tableheaderrow do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.table_header_row/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :table_header_row
end

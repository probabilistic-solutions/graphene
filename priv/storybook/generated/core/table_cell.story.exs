defmodule Storybook.CodeGen.CoreComponents.Tablecell do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.table_cell/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :table_cell
end

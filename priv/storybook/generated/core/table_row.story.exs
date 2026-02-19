defmodule Storybook.CodeGen.CoreComponents.Tablerow do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.table_row/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :table_row
end

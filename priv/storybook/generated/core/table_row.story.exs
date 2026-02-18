defmodule Storybook.CodeGen.CoreComponents.Tablerow do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.table_row/1,
    component_module: Graphene.CoreComponents,
    component_name: :table_row
end

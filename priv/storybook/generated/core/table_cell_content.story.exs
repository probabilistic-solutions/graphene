defmodule Storybook.CodeGen.CoreComponents.Tablecellcontent do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.table_cell_content/1,
    component_module: Graphene.CoreComponents,
    component_name: :table_cell_content
end

defmodule Storybook.CodeGen.CoreComponents.Tablecellcontent do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.table_cell_content/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :table_cell_content
end

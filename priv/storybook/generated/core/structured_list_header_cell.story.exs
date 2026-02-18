defmodule Storybook.CodeGen.CoreComponents.Structuredlistheadercell do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.structured_list_header_cell/1,
    component_module: Graphene.CoreComponents,
    component_name: :structured_list_header_cell
end

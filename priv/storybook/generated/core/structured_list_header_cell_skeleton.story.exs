defmodule Storybook.CodeGen.CoreComponents.Structuredlistheadercellskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.structured_list_header_cell_skeleton/1,
    component_module: Graphene.CoreComponents,
    component_name: :structured_list_header_cell_skeleton
end

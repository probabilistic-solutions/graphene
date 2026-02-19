defmodule Storybook.CodeGen.CoreComponents.Structuredlistheadercell do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.structured_list_header_cell/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :structured_list_header_cell
end

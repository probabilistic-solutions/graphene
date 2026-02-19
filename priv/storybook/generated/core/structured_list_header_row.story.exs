defmodule Storybook.CodeGen.CoreComponents.Structuredlistheaderrow do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.structured_list_header_row/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :structured_list_header_row
end

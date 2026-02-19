defmodule Storybook.CodeGen.CoreComponents.Structuredlistrow do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.structured_list_row/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :structured_list_row
end

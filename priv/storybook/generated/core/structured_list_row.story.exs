defmodule Storybook.CodeGen.CoreComponents.Structuredlistrow do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.structured_list_row/1,
    component_module: Graphene.CoreComponents,
    component_name: :structured_list_row
end

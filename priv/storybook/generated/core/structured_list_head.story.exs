defmodule Storybook.CodeGen.CoreComponents.Structuredlisthead do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.structured_list_head/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :structured_list_head
end

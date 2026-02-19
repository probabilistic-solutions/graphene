defmodule Storybook.CodeGen.CoreComponents.Structuredlist do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.structured_list/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :structured_list
end

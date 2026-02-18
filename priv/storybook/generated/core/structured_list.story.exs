defmodule Storybook.CodeGen.CoreComponents.Structuredlist do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.structured_list/1,
    component_module: Graphene.CoreComponents,
    component_name: :structured_list
end

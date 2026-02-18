defmodule Storybook.CodeGen.CoreComponents.Structuredlistbody do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.structured_list_body/1,
    component_module: Graphene.CoreComponents,
    component_name: :structured_list_body
end

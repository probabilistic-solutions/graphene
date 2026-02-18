defmodule Storybook.CodeGen.CoreComponents.Pagination do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.pagination/1,
    component_module: Graphene.CoreComponents,
    component_name: :pagination
end

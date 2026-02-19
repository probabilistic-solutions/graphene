defmodule Storybook.CodeGen.CoreComponents.Pagination do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.pagination/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :pagination
end

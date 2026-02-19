defmodule Storybook.CodeGen.CoreComponents.Paginationnav do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.pagination_nav/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :pagination_nav
end

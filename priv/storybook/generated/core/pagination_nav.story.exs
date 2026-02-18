defmodule Storybook.CodeGen.CoreComponents.Paginationnav do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.pagination_nav/1,
    component_module: Graphene.CoreComponents,
    component_name: :pagination_nav
end

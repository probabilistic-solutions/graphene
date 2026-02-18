defmodule Storybook.CodeGen.CoreComponents.Breadcrumblink do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.breadcrumb_link/1,
    component_module: Graphene.CoreComponents,
    component_name: :breadcrumb_link
end

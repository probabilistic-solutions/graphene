defmodule Storybook.CodeGen.CoreComponents.Breadcrumblink do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.breadcrumb_link/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :breadcrumb_link
end

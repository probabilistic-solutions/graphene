defmodule Storybook.CodeGen.CoreComponents.Breadcrumbskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.breadcrumb_skeleton/1,
    component_module: Graphene.CoreComponents,
    component_name: :breadcrumb_skeleton
end

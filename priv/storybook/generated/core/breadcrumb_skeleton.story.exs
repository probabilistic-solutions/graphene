defmodule Storybook.CodeGen.CoreComponents.Breadcrumbskeleton do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.breadcrumb_skeleton/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :breadcrumb_skeleton
end

defmodule Storybook.CodeGen.CoreComponents.Breadcrumb do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.breadcrumb/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :breadcrumb
end

defmodule Storybook.CodeGen.CoreComponents.Breadcrumbitem do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.breadcrumb_item/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :breadcrumb_item
end

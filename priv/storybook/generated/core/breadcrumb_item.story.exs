defmodule Storybook.CodeGen.CoreComponents.Breadcrumbitem do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.breadcrumb_item/1,
    component_module: Graphene.CoreComponents,
    component_name: :breadcrumb_item
end

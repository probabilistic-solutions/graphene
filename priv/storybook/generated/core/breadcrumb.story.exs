defmodule Storybook.CodeGen.CoreComponents.Breadcrumb do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.breadcrumb/1,
    component_module: Graphene.CoreComponents,
    component_name: :breadcrumb
end

defmodule Storybook.CodeGen.CoreComponents.Pageheaderbreadcrumb do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.page_header_breadcrumb/1,
    component_module: Graphene.CoreComponents,
    component_name: :page_header_breadcrumb
end

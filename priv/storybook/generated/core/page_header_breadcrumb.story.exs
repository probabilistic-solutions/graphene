defmodule Storybook.CodeGen.CoreComponents.Pageheaderbreadcrumb do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.page_header_breadcrumb/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :page_header_breadcrumb
end

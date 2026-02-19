defmodule Storybook.CodeGen.CoreComponents.Pageheadercontent do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.page_header_content/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :page_header_content
end

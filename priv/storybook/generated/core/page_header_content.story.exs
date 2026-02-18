defmodule Storybook.CodeGen.CoreComponents.Pageheadercontent do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.page_header_content/1,
    component_module: Graphene.CoreComponents,
    component_name: :page_header_content
end

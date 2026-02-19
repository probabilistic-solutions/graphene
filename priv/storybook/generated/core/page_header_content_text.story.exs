defmodule Storybook.CodeGen.CoreComponents.Pageheadercontenttext do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.page_header_content_text/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :page_header_content_text
end

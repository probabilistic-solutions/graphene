defmodule Storybook.CodeGen.CoreComponents.Pageheadertabs do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.page_header_tabs/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :page_header_tabs
end

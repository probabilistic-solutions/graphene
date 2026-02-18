defmodule Storybook.CodeGen.CoreComponents.Pageheadertabs do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.page_header_tabs/1,
    component_module: Graphene.CoreComponents,
    component_name: :page_header_tabs
end

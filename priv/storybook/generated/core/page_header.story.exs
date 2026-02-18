defmodule Storybook.CodeGen.CoreComponents.Pageheader do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.page_header/1,
    component_module: Graphene.CoreComponents,
    component_name: :page_header
end

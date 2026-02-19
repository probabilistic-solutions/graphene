defmodule Storybook.CodeGen.CoreComponents.Pageheader do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.page_header/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :page_header
end

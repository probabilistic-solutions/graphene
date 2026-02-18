defmodule Storybook.CodeGen.CoreComponents.Tableheadertitle do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.table_header_title/1,
    component_module: Graphene.CoreComponents,
    component_name: :table_header_title
end

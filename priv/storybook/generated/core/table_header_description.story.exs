defmodule Storybook.CodeGen.CoreComponents.Tableheaderdescription do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.table_header_description/1,
    component_module: Graphene.CoreComponents,
    component_name: :table_header_description
end

defmodule Storybook.CodeGen.CoreComponents.Tableheaderdescription do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.table_header_description/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :table_header_description
end

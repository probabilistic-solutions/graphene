defmodule Storybook.CodeGen.CoreComponents.Tablehead do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.table_head/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :table_head
end

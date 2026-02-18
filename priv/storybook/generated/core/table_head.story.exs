defmodule Storybook.CodeGen.CoreComponents.Tablehead do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.table_head/1,
    component_module: Graphene.CoreComponents,
    component_name: :table_head
end

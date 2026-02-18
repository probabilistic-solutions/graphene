defmodule Storybook.CodeGen.CoreComponents.Table do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.table/1,
    component_module: Graphene.CoreComponents,
    component_name: :table
end

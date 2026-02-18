defmodule Storybook.CodeGen.CoreComponents.Tableskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.table_skeleton/1,
    component_module: Graphene.CoreComponents,
    component_name: :table_skeleton
end

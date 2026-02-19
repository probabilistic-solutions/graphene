defmodule Storybook.CodeGen.CoreComponents.Tableskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.table_skeleton/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :table_skeleton
end

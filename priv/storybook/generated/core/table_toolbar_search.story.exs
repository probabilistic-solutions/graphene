defmodule Storybook.CodeGen.CoreComponents.Tabletoolbarsearch do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.table_toolbar_search/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :table_toolbar_search
end

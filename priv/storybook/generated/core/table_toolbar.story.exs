defmodule Storybook.CodeGen.CoreComponents.Tabletoolbar do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.table_toolbar/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :table_toolbar
end

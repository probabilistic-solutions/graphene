defmodule Storybook.CodeGen.CoreComponents.Tabletoolbar do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.table_toolbar/1,
    component_module: Graphene.CoreComponents,
    component_name: :table_toolbar
end

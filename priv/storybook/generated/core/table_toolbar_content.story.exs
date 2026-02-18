defmodule Storybook.CodeGen.CoreComponents.Tabletoolbarcontent do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.table_toolbar_content/1,
    component_module: Graphene.CoreComponents,
    component_name: :table_toolbar_content
end

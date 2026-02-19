defmodule Storybook.CodeGen.CoreComponents.Tabletoolbarcontent do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.table_toolbar_content/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :table_toolbar_content
end

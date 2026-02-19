defmodule Storybook.CodeGen.CoreComponents.Tableheadertitle do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.table_header_title/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :table_header_title
end

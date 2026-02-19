defmodule Storybook.CodeGen.CoreComponents.Tablebody do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.table_body/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :table_body
end

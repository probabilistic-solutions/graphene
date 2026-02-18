defmodule Storybook.CodeGen.CoreComponents.Tablebody do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.table_body/1,
    component_module: Graphene.CoreComponents,
    component_name: :table_body
end

defmodule Storybook.CodeGen.CoreComponents.Tableelement do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.table_element/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :table_element
end

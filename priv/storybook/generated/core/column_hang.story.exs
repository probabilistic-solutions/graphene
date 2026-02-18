defmodule Storybook.CodeGen.CoreComponents.Columnhang do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.column_hang/1,
    component_module: Graphene.CoreComponents,
    component_name: :column_hang
end

defmodule Storybook.CodeGen.CoreComponents.Columnhang do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.column_hang/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :column_hang
end

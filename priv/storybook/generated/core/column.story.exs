defmodule Storybook.CodeGen.CoreComponents.Column do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.column/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :column
end

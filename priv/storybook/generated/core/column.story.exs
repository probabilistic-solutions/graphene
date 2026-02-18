defmodule Storybook.CodeGen.CoreComponents.Column do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.column/1,
    component_module: Graphene.CoreComponents,
    component_name: :column
end

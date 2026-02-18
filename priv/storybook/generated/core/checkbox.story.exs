defmodule Storybook.CodeGen.CoreComponents.Checkbox do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.checkbox/1,
    component_module: Graphene.CoreComponents,
    component_name: :checkbox
end

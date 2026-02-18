defmodule Storybook.CodeGen.CoreComponents.Checkboxgroup do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.checkbox_group/1,
    component_module: Graphene.CoreComponents,
    component_name: :checkbox_group
end

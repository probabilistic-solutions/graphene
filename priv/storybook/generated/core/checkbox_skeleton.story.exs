defmodule Storybook.CodeGen.CoreComponents.Checkboxskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.checkbox_skeleton/1,
    component_module: Graphene.CoreComponents,
    component_name: :checkbox_skeleton
end

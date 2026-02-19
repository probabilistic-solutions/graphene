defmodule Storybook.CodeGen.CoreComponents.Checkboxskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.checkbox_skeleton/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :checkbox_skeleton
end

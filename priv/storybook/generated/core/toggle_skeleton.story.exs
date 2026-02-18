defmodule Storybook.CodeGen.CoreComponents.Toggleskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.toggle_skeleton/1,
    component_module: Graphene.CoreComponents,
    component_name: :toggle_skeleton
end

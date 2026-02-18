defmodule Storybook.CodeGen.CoreComponents.Selectskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.select_skeleton/1,
    component_module: Graphene.CoreComponents,
    component_name: :select_skeleton
end

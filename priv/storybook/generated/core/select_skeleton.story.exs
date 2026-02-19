defmodule Storybook.CodeGen.CoreComponents.Selectskeleton do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.select_skeleton/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :select_skeleton
end

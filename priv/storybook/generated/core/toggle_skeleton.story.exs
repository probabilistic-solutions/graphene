defmodule Storybook.CodeGen.CoreComponents.Toggleskeleton do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.toggle_skeleton/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :toggle_skeleton
end

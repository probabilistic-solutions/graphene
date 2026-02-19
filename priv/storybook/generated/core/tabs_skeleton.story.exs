defmodule Storybook.CodeGen.CoreComponents.Tabsskeleton do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.tabs_skeleton/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :tabs_skeleton
end

defmodule Storybook.CodeGen.CoreComponents.Tabsskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.tabs_skeleton/1,
    component_module: Graphene.CoreComponents,
    component_name: :tabs_skeleton
end

defmodule Storybook.CodeGen.CoreComponents.Accordionskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.accordion_skeleton/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :accordion_skeleton
end

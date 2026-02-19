defmodule Storybook.CodeGen.CoreComponents.Sliderskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.slider_skeleton/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :slider_skeleton
end

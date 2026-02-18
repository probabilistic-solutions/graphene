defmodule Storybook.CodeGen.CoreComponents.Sliderskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.slider_skeleton/1,
    component_module: Graphene.CoreComponents,
    component_name: :slider_skeleton
end

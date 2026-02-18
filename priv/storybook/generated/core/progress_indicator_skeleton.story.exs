defmodule Storybook.CodeGen.CoreComponents.Progressindicatorskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.progress_indicator_skeleton/1,
    component_module: Graphene.CoreComponents,
    component_name: :progress_indicator_skeleton
end

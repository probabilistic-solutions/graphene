defmodule Storybook.CodeGen.CoreComponents.Progressindicatorskeleton do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.progress_indicator_skeleton/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :progress_indicator_skeleton
end

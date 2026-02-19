defmodule Storybook.CodeGen.CoreComponents.Progressstepskeleton do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.progress_step_skeleton/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :progress_step_skeleton
end

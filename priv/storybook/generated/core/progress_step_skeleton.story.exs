defmodule Storybook.CodeGen.CoreComponents.Progressstepskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.progress_step_skeleton/1,
    component_module: Graphene.CoreComponents,
    component_name: :progress_step_skeleton
end

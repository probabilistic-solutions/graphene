defmodule Storybook.CodeGen.CoreComponents.Progressstep do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.progress_step/1,
    component_module: Graphene.CoreComponents,
    component_name: :progress_step
end

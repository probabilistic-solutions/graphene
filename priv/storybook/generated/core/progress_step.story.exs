defmodule Storybook.CodeGen.CoreComponents.Progressstep do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.progress_step/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :progress_step
end

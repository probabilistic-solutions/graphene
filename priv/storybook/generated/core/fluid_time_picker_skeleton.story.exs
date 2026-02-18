defmodule Storybook.CodeGen.CoreComponents.Fluidtimepickerskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.fluid_time_picker_skeleton/1,
    component_module: Graphene.CoreComponents,
    component_name: :fluid_time_picker_skeleton
end

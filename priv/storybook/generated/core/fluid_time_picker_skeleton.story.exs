defmodule Storybook.CodeGen.CoreComponents.Fluidtimepickerskeleton do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.fluid_time_picker_skeleton/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :fluid_time_picker_skeleton
end

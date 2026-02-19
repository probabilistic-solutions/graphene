defmodule Storybook.CodeGen.CoreComponents.Fluidtimepicker do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.fluid_time_picker/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :fluid_time_picker
end

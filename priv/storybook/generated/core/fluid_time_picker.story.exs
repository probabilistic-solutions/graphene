defmodule Storybook.CodeGen.CoreComponents.Fluidtimepicker do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.fluid_time_picker/1,
    component_module: Graphene.CoreComponents,
    component_name: :fluid_time_picker
end

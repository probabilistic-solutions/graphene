defmodule Storybook.CodeGen.CoreComponents.Fluidtimepickerselect do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.fluid_time_picker_select/1,
    component_module: Graphene.CoreComponents,
    component_name: :fluid_time_picker_select
end

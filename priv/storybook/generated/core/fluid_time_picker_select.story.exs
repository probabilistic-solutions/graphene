defmodule Storybook.CodeGen.CoreComponents.Fluidtimepickerselect do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.fluid_time_picker_select/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :fluid_time_picker_select
end

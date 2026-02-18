defmodule Storybook.CodeGen.CoreComponents.Fluidnumberinputskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.fluid_number_input_skeleton/1,
    component_module: Graphene.CoreComponents,
    component_name: :fluid_number_input_skeleton
end

defmodule Storybook.CodeGen.CoreComponents.Fluidnumberinput do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.fluid_number_input/1,
    component_module: Graphene.CoreComponents,
    component_name: :fluid_number_input
end

defmodule Storybook.CodeGen.CoreComponents.Fluidnumberinput do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.fluid_number_input/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :fluid_number_input
end

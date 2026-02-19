defmodule Storybook.CodeGen.CoreComponents.Fluidnumberinputskeleton do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.fluid_number_input_skeleton/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :fluid_number_input_skeleton
end

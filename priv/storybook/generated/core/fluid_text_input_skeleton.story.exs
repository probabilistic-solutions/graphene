defmodule Storybook.CodeGen.CoreComponents.Fluidtextinputskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.fluid_text_input_skeleton/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :fluid_text_input_skeleton
end

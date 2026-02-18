defmodule Storybook.CodeGen.CoreComponents.Fluidtextinputskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.fluid_text_input_skeleton/1,
    component_module: Graphene.CoreComponents,
    component_name: :fluid_text_input_skeleton
end

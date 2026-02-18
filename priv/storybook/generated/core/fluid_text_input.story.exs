defmodule Storybook.CodeGen.CoreComponents.Fluidtextinput do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.fluid_text_input/1,
    component_module: Graphene.CoreComponents,
    component_name: :fluid_text_input
end

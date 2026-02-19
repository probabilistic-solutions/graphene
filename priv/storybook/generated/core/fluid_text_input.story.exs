defmodule Storybook.CodeGen.CoreComponents.Fluidtextinput do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.fluid_text_input/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :fluid_text_input
end

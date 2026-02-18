defmodule Storybook.CodeGen.CoreComponents.Fluidtextarea do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.fluid_textarea/1,
    component_module: Graphene.CoreComponents,
    component_name: :fluid_textarea
end

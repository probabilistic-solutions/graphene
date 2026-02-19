defmodule Storybook.CodeGen.CoreComponents.Fluidtextarea do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.fluid_textarea/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :fluid_textarea
end

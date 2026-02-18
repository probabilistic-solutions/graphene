defmodule Storybook.CodeGen.CoreComponents.Fluidtextareaskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.fluid_textarea_skeleton/1,
    component_module: Graphene.CoreComponents,
    component_name: :fluid_textarea_skeleton
end

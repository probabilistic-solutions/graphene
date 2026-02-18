defmodule Storybook.CodeGen.CoreComponents.Fluidselect do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.fluid_select/1,
    component_module: Graphene.CoreComponents,
    component_name: :fluid_select
end

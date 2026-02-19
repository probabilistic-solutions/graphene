defmodule Storybook.CodeGen.CoreComponents.Fluidselect do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.fluid_select/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :fluid_select
end

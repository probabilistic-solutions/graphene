defmodule Storybook.CodeGen.CoreComponents.Fluidselectskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.fluid_select_skeleton/1,
    component_module: Graphene.CoreComponents,
    component_name: :fluid_select_skeleton
end

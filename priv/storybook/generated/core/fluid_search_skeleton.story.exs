defmodule Storybook.CodeGen.CoreComponents.Fluidsearchskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.fluid_search_skeleton/1,
    component_module: Graphene.CoreComponents,
    component_name: :fluid_search_skeleton
end

defmodule Storybook.CodeGen.CoreComponents.Fluidsearchskeleton do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.fluid_search_skeleton/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :fluid_search_skeleton
end

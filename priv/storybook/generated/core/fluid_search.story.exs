defmodule Storybook.CodeGen.CoreComponents.Fluidsearch do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.fluid_search/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :fluid_search
end

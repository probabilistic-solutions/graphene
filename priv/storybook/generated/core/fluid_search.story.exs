defmodule Storybook.CodeGen.CoreComponents.Fluidsearch do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.fluid_search/1,
    component_module: Graphene.CoreComponents,
    component_name: :fluid_search
end

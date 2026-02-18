defmodule Storybook.CodeGen.CoreComponents.Search do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.search/1,
    component_module: Graphene.CoreComponents,
    component_name: :search
end

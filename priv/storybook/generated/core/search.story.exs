defmodule Storybook.CodeGen.CoreComponents.Search do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.search/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :search
end

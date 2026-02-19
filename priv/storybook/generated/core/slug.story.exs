defmodule Storybook.CodeGen.CoreComponents.Slug do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.slug/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :slug
end

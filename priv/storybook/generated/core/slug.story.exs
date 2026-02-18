defmodule Storybook.CodeGen.CoreComponents.Slug do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.slug/1,
    component_module: Graphene.CoreComponents,
    component_name: :slug
end

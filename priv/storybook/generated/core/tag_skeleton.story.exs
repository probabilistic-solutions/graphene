defmodule Storybook.CodeGen.CoreComponents.Tagskeleton do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.tag_skeleton/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :tag_skeleton
end

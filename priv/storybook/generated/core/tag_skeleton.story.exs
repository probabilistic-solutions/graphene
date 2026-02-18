defmodule Storybook.CodeGen.CoreComponents.Tagskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.tag_skeleton/1,
    component_module: Graphene.CoreComponents,
    component_name: :tag_skeleton
end

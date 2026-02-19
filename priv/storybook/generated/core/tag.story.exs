defmodule Storybook.CodeGen.CoreComponents.Tag do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.tag/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :tag
end

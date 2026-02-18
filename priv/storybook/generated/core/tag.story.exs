defmodule Storybook.CodeGen.CoreComponents.Tag do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.tag/1,
    component_module: Graphene.CoreComponents,
    component_name: :tag
end

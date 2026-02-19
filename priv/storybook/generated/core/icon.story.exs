defmodule Storybook.CodeGen.CoreComponents.Icon do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.icon/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :icon
end

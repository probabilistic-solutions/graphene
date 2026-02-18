defmodule Storybook.CodeGen.CoreComponents.Icon do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.icon/1,
    component_module: Graphene.CoreComponents,
    component_name: :icon
end

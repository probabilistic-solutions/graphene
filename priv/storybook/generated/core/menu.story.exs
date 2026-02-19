defmodule Storybook.CodeGen.CoreComponents.Menu do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.menu/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :menu
end

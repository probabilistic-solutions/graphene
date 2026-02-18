defmodule Storybook.CodeGen.CoreComponents.Menu do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.menu/1,
    component_module: Graphene.CoreComponents,
    component_name: :menu
end

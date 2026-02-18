defmodule Storybook.CodeGen.CoreComponents.Switcher do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.switcher/1,
    component_module: Graphene.CoreComponents,
    component_name: :switcher
end

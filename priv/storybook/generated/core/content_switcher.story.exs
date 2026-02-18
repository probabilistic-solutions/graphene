defmodule Storybook.CodeGen.CoreComponents.Contentswitcher do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.content_switcher/1,
    component_module: Graphene.CoreComponents,
    component_name: :content_switcher
end

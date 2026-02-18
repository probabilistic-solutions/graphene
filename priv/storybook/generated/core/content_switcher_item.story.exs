defmodule Storybook.CodeGen.CoreComponents.Contentswitcheritem do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.content_switcher_item/1,
    component_module: Graphene.CoreComponents,
    component_name: :content_switcher_item
end

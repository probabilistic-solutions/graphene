defmodule Storybook.CodeGen.CoreComponents.Contentswitcheritem do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.content_switcher_item/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :content_switcher_item
end

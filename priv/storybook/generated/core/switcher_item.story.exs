defmodule Storybook.CodeGen.CoreComponents.Switcheritem do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.switcher_item/1,
    component_module: Graphene.CoreComponents,
    component_name: :switcher_item
end

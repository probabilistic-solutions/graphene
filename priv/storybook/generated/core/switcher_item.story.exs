defmodule Storybook.CodeGen.CoreComponents.Switcheritem do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.switcher_item/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :switcher_item
end

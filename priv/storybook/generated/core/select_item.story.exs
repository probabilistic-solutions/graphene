defmodule Storybook.CodeGen.CoreComponents.Selectitem do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.select_item/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :select_item
end

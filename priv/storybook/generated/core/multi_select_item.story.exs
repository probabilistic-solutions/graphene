defmodule Storybook.CodeGen.CoreComponents.Multiselectitem do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.multi_select_item/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :multi_select_item
end

defmodule Storybook.CodeGen.CoreComponents.Headernavitem do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.header_nav_item/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :header_nav_item
end

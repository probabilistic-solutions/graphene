defmodule Storybook.CodeGen.CoreComponents.Clickabletile do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.clickable_tile/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :clickable_tile
end

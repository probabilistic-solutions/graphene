defmodule Storybook.CodeGen.CoreComponents.Expandabletile do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.expandable_tile/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :expandable_tile
end

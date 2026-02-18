defmodule Storybook.CodeGen.CoreComponents.Selectabletile do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.selectable_tile/1,
    component_module: Graphene.CoreComponents,
    component_name: :selectable_tile
end

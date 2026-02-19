defmodule Storybook.CodeGen.CoreComponents.Radiotile do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.radio_tile/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :radio_tile
end

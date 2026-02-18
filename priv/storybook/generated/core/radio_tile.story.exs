defmodule Storybook.CodeGen.CoreComponents.Radiotile do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.radio_tile/1,
    component_module: Graphene.CoreComponents,
    component_name: :radio_tile
end

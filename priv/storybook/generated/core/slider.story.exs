defmodule Storybook.CodeGen.CoreComponents.Slider do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.slider/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :slider
end

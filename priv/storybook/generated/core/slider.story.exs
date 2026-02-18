defmodule Storybook.CodeGen.CoreComponents.Slider do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.slider/1,
    component_module: Graphene.CoreComponents,
    component_name: :slider
end

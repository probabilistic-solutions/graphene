defmodule Storybook.CodeGen.CoreComponents.Sliderinput do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.slider_input/1,
    component_module: Graphene.CoreComponents,
    component_name: :slider_input
end

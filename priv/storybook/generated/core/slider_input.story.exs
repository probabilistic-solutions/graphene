defmodule Storybook.CodeGen.CoreComponents.Sliderinput do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.slider_input/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :slider_input
end

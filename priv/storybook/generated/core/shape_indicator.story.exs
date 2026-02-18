defmodule Storybook.CodeGen.CoreComponents.Shapeindicator do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.shape_indicator/1,
    component_module: Graphene.CoreComponents,
    component_name: :shape_indicator
end

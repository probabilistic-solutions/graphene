defmodule Storybook.CodeGen.CoreComponents.Shapeindicator do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.shape_indicator/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :shape_indicator
end

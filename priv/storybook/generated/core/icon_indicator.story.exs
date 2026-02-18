defmodule Storybook.CodeGen.CoreComponents.Iconindicator do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.icon_indicator/1,
    component_module: Graphene.CoreComponents,
    component_name: :icon_indicator
end

defmodule Storybook.CodeGen.CoreComponents.Iconindicator do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.icon_indicator/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :icon_indicator
end

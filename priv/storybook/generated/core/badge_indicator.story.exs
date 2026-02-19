defmodule Storybook.CodeGen.CoreComponents.Badgeindicator do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.badge_indicator/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :badge_indicator
end

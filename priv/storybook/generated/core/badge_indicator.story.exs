defmodule Storybook.CodeGen.CoreComponents.Badgeindicator do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.badge_indicator/1,
    component_module: Graphene.CoreComponents,
    component_name: :badge_indicator
end

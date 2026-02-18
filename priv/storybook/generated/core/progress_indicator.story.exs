defmodule Storybook.CodeGen.CoreComponents.Progressindicator do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.progress_indicator/1,
    component_module: Graphene.CoreComponents,
    component_name: :progress_indicator
end

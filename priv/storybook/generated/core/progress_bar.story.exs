defmodule Storybook.CodeGen.CoreComponents.Progressbar do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.progress_bar/1,
    component_module: Graphene.CoreComponents,
    component_name: :progress_bar
end

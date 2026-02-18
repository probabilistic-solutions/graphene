defmodule Storybook.CodeGen.CoreComponents.Sidepanel do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.side_panel/1,
    component_module: Graphene.CoreComponents,
    component_name: :side_panel
end

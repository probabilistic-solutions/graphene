defmodule Storybook.CodeGen.CoreComponents.Sidepanel do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.side_panel/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :side_panel
end

defmodule Storybook.CodeGen.CoreComponents.Headerpanel do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.header_panel/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :header_panel
end

defmodule Storybook.CodeGen.CoreComponents.Headernav do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.header_nav/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :header_nav
end

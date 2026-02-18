defmodule Storybook.CodeGen.CoreComponents.Headernav do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.header_nav/1,
    component_module: Graphene.CoreComponents,
    component_name: :header_nav
end

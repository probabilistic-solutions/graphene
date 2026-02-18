defmodule Storybook.CodeGen.CoreComponents.Headermenu do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.header_menu/1,
    component_module: Graphene.CoreComponents,
    component_name: :header_menu
end

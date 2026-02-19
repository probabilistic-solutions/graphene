defmodule Storybook.CodeGen.CoreComponents.Headermenu do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.header_menu/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :header_menu
end

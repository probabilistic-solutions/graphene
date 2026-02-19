defmodule Storybook.CodeGen.CoreComponents.Overflowmenu do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.overflow_menu/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :overflow_menu
end

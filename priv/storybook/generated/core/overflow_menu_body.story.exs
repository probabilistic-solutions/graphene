defmodule Storybook.CodeGen.CoreComponents.Overflowmenubody do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.overflow_menu_body/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :overflow_menu_body
end

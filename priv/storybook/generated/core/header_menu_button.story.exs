defmodule Storybook.CodeGen.CoreComponents.Headermenubutton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.header_menu_button/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :header_menu_button
end

defmodule Storybook.CodeGen.CoreComponents.Headermenubutton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.header_menu_button/1,
    component_module: Graphene.CoreComponents,
    component_name: :header_menu_button
end

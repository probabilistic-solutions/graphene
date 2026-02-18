defmodule Storybook.CodeGen.CoreComponents.Menubutton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.menu_button/1,
    component_module: Graphene.CoreComponents,
    component_name: :menu_button
end

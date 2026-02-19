defmodule Storybook.CodeGen.CoreComponents.Menubutton do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.menu_button/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :menu_button
end

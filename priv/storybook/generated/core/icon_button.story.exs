defmodule Storybook.CodeGen.CoreComponents.Iconbutton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.icon_button/1,
    component_module: Graphene.CoreComponents,
    component_name: :icon_button
end

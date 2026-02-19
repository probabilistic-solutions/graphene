defmodule Storybook.CodeGen.CoreComponents.Iconbutton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.icon_button/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :icon_button
end

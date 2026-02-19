defmodule Storybook.CodeGen.CoreComponents.Copybutton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.copy_button/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :copy_button
end
